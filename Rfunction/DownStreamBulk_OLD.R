 ID<-"web-test"
 filePath="E:/0_webserve/4_example/bulk"
 clinical="TCGA_LUAD_clinical.txt"
 innerpath="E:/0_webserve/2_methods/innerpath"
 corrThreshold=0.3



DownStreamBulk<-function(ID,filePath,clinical,innerpath,corrThreshold){
  suppressMessages({
    library(dplyr)
    library(jsonlite)
    library(stringr)
    library(psych)
    library(GSVA)
    library(ggplot2)
    library(pheatmap)
  })
  ID<-ID
  filePath<-filePath
  clinical<-clinical
  innerpath<-innerpath
  corrThreshold<-corrThreshold
  corr_re_table_web<-"none"
  corr_re_table_download<-"none"
  steam_gene_top_heatmap<-"none"
  gene_heatmap_all_heatmap<-"none"
  hallmarker_infor_web<-"none"
  hallmarker_infor_download<-"none"
  hallmarker_heatmap_web<-"none"
  hallmarker_corr_web<-"none"
  CIBERSORT_infor_web<-"none"
  CIBERSORT_infor_download<-"none"
  CIBERSORT_heatmap_web<-"none"
  CIBERSORT_corr_web<-"none"
  survival_photo<-"none"
  survival_logrank_p<-"none"
  survival_cox_p<-"none"
  survival_cox_beta_v<-"none"
  survival_cox_beta_class<-"none"
  tryCatch({
    stopMessage<-"no"
    outpath<-paste0(filePath,"/",ID,"/DownStream")
    if(!dir.exists(outpath)){
      dir.create(outpath)
    }
    ####0.id infor ####
    Task_ID <- as.matrix(read.table(paste0(innerpath,"/","Job_ID.txt"),header = F,sep = "\t",check.names = F,fill = T))
    Task_ID_state<-Task_ID[which(Task_ID[,1]==ID),2]
    Task_ID[which(Task_ID[,1]==ID),2] <- "downstreamRun"
    
    ####1.read base infor #####
    source(paste0(innerpath,"/","resultFunctionMethod.R"))
    baseinfor_list=read_json(paste0(filePath,"/",ID,"/CS_re.txt"))
    csScore=read.table(paste0(filePath,"/",ID,"/CSscore_tableDownload.txt"),header = T,sep = "\t",as.is=TRUE,quote = "",check.names = F)
    expressionFile_all <- read.table(paste0(filePath,"/",ID,"/",baseinfor_list[["ExpfileName"]]),header = T,sep = "\t",as.is=TRUE,quote = "",row.names = 1,check.names = F)
    expressionFile<-expressionFile_all[,csScore$samplename]
    score_df<-read.table(paste0(filePath,"/",ID,"/CSscore_tableDownload.txt"),header = T,sep = "\t",as.is=TRUE,quote = "",check.names = F,row.names = 1)
    
    corr_re<-corr_sore(t(expressionFile),score_df,"spearman",corrThreshold,outpath)
    corr_re_df<-corr_re$corr_re_merge_sig_out
    corr_re_df<-corr_re_df[order(corr_re_df$corr,decreasing = T),]
    corr_re_table_web<-corr_re$cs_infor_web
    corr_re_table_download<-corr_re$cs_infor_download
    if((corr_re_table_web=="none") & corr_re_table_download=="none"){
      stremGene<-"none"
    }else{
      stremGene<-"success"
      ####gene scatter plot #####
      sig_gene<-rownames(corr_re_df)
      stem_gene_scatter(expressionFile,csScore,sig_gene,outpath)
      #### gene  plot #####
      stem_gene_heatmap_re<-stem_gene_heatmap(expressionFile,csScore,sig_gene,50,outpath)
      steam_gene_top_heatmap<-stem_gene_heatmap_re$steam_gene_top
      gene_heatmap_all_heatmap<-stem_gene_heatmap_re$steam_gene_all
      #### function enrich #####
      hallmarker_re<-gsva_pathway(expressionFile,score_df,sig_gene,"cancerhallmark",corrThreshold,outpath,innerpath)
      hallmarker_success<-hallmarker_re$hallmarker_success
      if (hallmarker_success=="yes"){
        hallmarker_infor_web<-hallmarker_re$hallmarker_infor_web
        hallmarker_infor_download<-hallmarker_re$hallmarker_infor_download
        hallmarker_heatmap_web<-hallmarker_re$hallmarker_heatmap_web
        hallmarker_corr_web<-hallmarker_re$hallmarker_corr_web
      }
      Cibersortre<-Cibersort_imm(expressionFile,csScore,corrThreshold,outpath,innerpath)
      CIBERSORT_success<-Cibersortre$CIBERSORT_success
      if (CIBERSORT_success=="yes"){
        CIBERSORT_infor_web<-Cibersortre$CIBERSORT_infor_web
        CIBERSORT_infor_download<-Cibersortre$CIBERSORT_infor_download
        CIBERSORT_heatmap_web<-Cibersortre$CIBERSORT_heatmap_web
        CIBERSORT_corr_web<-Cibersortre$CIBERSORT_corr_web
      }

      ####survival optional ####
      
      if (clinical=="none"){
        survival_infor<-"none"
        clinical_infor<-"none"
      }else{
        clinical_infor<-read.table(paste0(filePath,"/",ID,"/",clinical),header = T,sep = "\t",as.is=TRUE,quote = "",check.names = F,row.names = 1)
        
        survival_re<- survival_all(clinical_infor,csScore,outpath)
        survival_infor<-survival_re$survival_infor
        if (survival_infor=="yes"){
          survival_photo<-survival_re$survival_photo
          survival_logrank_p<-survival_re$survival_logrank_p
          survival_cox_p<-survival_re$survival_cox_p
          survival_cox_beta_v<-survival_re$survival_cox_beta_v
          survival_cox_beta_class<-survival_re$survival_cox_beta_class
          
        }
        
      }
      #####compare with other####
      methods_compare=c("mRNAsi","GSVA")
      ###1.mRNAsi###
      mRNAsi_model<-readRDS(paste0(innerpath,"/model.RNA_test.Rds"))
      common <- intersect(names(mRNAsi_model$w), rownames(expressionFile))
      X <- expressionFile[common, ]
      w <- mRNAsi_model$w[common]
      score <- apply(X, 2, function(z) {cor(z, w, method="sp", use="complete.obs")})
      score <- score - min(score)
      score <- score / max(score)
      CSscore_mRNAsi<-data.frame(samplename=names(score),score=unname(score))
      #####2. CytoTRACE####
      source(paste0(innerpath,"/","all_FUN.R"))
      score<-CytoTRACE(expressionFile)
      CSscore_CytoTRACE<-data.frame(samplename=names(score$CytoTRACE),score=unname(score$CytoTRACE))
      ###merge score###
      inter_sample=intersect(CSscore_CytoTRACE$samplename,CSscore_mRNAsi$samplename)
      inter_sample=intersect(csScore$samplename,inter_sample)
      score_compare=data.frame(m1=csScore[which(csScore$samplename %in% inter_sample),2],
                               m2=CSscore_mRNAsi[which(CSscore_mRNAsi$samplename %in% inter_sample),2],
                               m3=CSscore_CytoTRACE[which(CSscore_CytoTRACE$samplename %in% inter_sample),2] )
      base_method=baseinfor_list$method
      colnames(score_compare)=c(base_method,"Supervised_mRNAsi","Unsupervised_CytoTRACE")
      rownames(score_compare)=inter_sample
      if (base_method =="mRNAsi"){
        score_compare=score_compare[,c(base_method,"Unsupervised_CytoTRACE")]
      }else if(base_method =="CytoTRACE"){
        score_compare=score_compare[,c(base_method,"Supervised_mRNAsi")]
      }
      
      methods_compare_re<-methods_compare_fun(score_compare,outpath,base_method,clinical,clinical_infor)
      
      
    }
    ##
   
    
    out_end <- paste0("{","\n",
                      '"dataType" :','"',baseinfor_list$dataType,'",',"\n",
                      '"method" :','"',baseinfor_list$method,'",',"\n",
                      '"JobID" :','"',baseinfor_list$JobID,'",',"\n",
                      '"SampleNumAll" :','"',baseinfor_list$SampleNumAll,'",',"\n",
                      '"SampleNumCancer" :','"',baseinfor_list$SampleNumCancer,'",',"\n",
                      '"GeneNumAll" :','"',baseinfor_list$GeneNumAll,'",',"\n",
                      '"ExpfileName" :','"',baseinfor_list$ExpfileName,'",',"\n",
                      '"SamplefileName" :','"',baseinfor_list$SamplefileName,'",',"\n",
                      '"email_address" :','"',baseinfor_list$email_address,'",',"\n",
                      '"clinical" :','"',clinical,'",',"\n",
                      '"corrThreshold" :','"',corrThreshold,'",',"\n",
                      '"stremGene" :','"',stremGene,'",',"\n",
                      '"corr_re_table_web" :','"',corr_re_table_web,'",',"\n",
                      '"corr_re_table_download" :','"',corr_re_table_download,'",',"\n",
                      '"steam_gene_top_heatmap" :','"',steam_gene_top_heatmap,'",',"\n",
                      '"gene_heatmap_all_heatmap" :','"',gene_heatmap_all_heatmap,'",',"\n",
                      '"hallmarker_success" :','"',hallmarker_success,'",',"\n",
                      '"hallmarker_infor_web" :','"',hallmarker_infor_web,'",',"\n",
                      '"hallmarker_infor_download" :','"',hallmarker_infor_download,'",',"\n",
                      '"hallmarker_heatmap_web" :','"',hallmarker_heatmap_web,'",',"\n",
                      '"hallmarker_corr_web" :','"',hallmarker_corr_web,'",',"\n",
                      '"CIBERSORT_success" :','"',CIBERSORT_success,'",',"\n",
                      '"CIBERSORT_infor_web" :','"',CIBERSORT_infor_web,'",',"\n",
                      '"CIBERSORT_infor_download" :','"',CIBERSORT_infor_download,'",',"\n",
                      '"CIBERSORT_heatmap_web" :','"',CIBERSORT_heatmap_web,'",',"\n",
                      '"CIBERSORT_corr_web" :','"',CIBERSORT_corr_web,'",',"\n",
                      '"survival_infor" :','"',survival_infor,'",',"\n",
                      '"survival_photo" :','"',survival_photo,'",',"\n",
                      '"survival_logrank_p" :','"',survival_logrank_p,'",',"\n",
                      '"survival_cox_p" :','"',survival_cox_p,'",',"\n",
                      '"survival_cox_beta_v" :','"',survival_cox_beta_v,'",',"\n",
                      '"survival_cox_beta_class" :','"',survival_cox_beta_class,'",',"\n",
                      '"compare_score_error" :','"',methods_compare_re$error_attention_table,'",',"\n",
                      '"compare_score_download" :','"',methods_compare_re$compare_score_download,'",',"\n",
                      '"compare_score_web" :','"',methods_compare_re$compare_score_web,'",',"\n",
                      '"compare_corr_download" :','"',methods_compare_re$compare_corr_download,'",',"\n",
                      '"compare_corr_web" :','"',methods_compare_re$compare_corr_web,'",',"\n",
                      '"compare_clinical_all" :','"',methods_compare_re$clinical_all,'",',"\n",
                      '"compare_clinical_mRNAsi_error" :','"',methods_compare_re$clinical_mRNAsi_error,'",',"\n",
                      '"compare_clinical_mRNAsi_photo" :','"',methods_compare_re$clinical_mRNAsi_photo,'",',"\n",
                      '"compare_clinical_mRNAsi_logrank_p" :','"',methods_compare_re$clinical_mRNAsi_logrank_p,'",',"\n",
                      '"compare_clinical_mRNAsi_cox_p" :','"',methods_compare_re$clinical_mRNAsi_cox_p,'",',"\n",
                      '"compare_clinical_mRNAsi_cox_beta_v" :','"',methods_compare_re$clinical_mRNAsi_cox_beta_v,'",',"\n",
                      '"compare_clinical_mRNAsi_cox_beta_class" :','"',methods_compare_re$clinical_mRNAsi_cox_beta_class,'",',"\n",
                      '"compare_clinical_CytoTRACE_error" :','"',methods_compare_re$clinical_CytoTRACE_error,'",',"\n",
                      '"compare_clinical_CytoTRACE_photo" :','"',methods_compare_re$clinical_CytoTRACE_photo,'",',"\n",
                      '"compare_clinical_CytoTRACE_logrank_p" :','"',methods_compare_re$clinical_CytoTRACE_logrank_p,'",',"\n",
                      '"compare_clinical_CytoTRACE_cox_p" :','"',methods_compare_re$clinical_CytoTRACE_cox_p,'",',"\n",
                      '"compare_clinical_CytoTRACE_cox_beta_v" :','"',methods_compare_re$clinical_CytoTRACE_cox_beta_v,'",',"\n",
                      '"compare_clinical_CytoTRACE_cox_beta_class" :','"',methods_compare_re$clinical_CytoTRACE_cox_beta_class,'",',"\n",
                      '"stopMessage" :','"',stopMessage,'"',"\n",
                      '}'
                      
    )
    write.table(out_end,paste0(outpath,"/","DownStream_re.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    Task_ID[which(Task_ID[,1]==ID),2] <- "downstreamSuccess"
    write.table(Task_ID,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    return(result_message)

  },error = function(e){
    stopMessage<-"something wrong"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    Task_ID[which(Task_ID[,1]==ID),2] <- "downstreamDead"
    write.table(Task_ID,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    return(result_message)
    
  })
  
  
}