#ID<-"bulk_userUpload"
#filePath<-"E:/0_webserve/4_example/bulk/userupload"
#clinicalfileName<-"TCGA_LUAD_sanpleInfor_example.txt"
#innerpath<-"E:/0_webserve/2_methods/innerpath"
#corrThreshold<-0.5
#email_address<-"aaaa"
#ExpfileName<-"TCGA_LUAD_Exp_example.txt"
DownStreamBulkUser<-function(ID,filePath,ExpfileName,clinicalfileName,innerpath,corrThreshold,email_address){
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
  ExpfileName<-ExpfileName
  filePath<-filePath
  clinicalfileName<-clinicalfileName
  innerpath<-innerpath
  corrThreshold<-corrThreshold
  email_address<-email_address
  type_m<-"bulk"
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
    outpath<-paste0(filePath,"/DownStream")
    if(!dir.exists(outpath)){      dir.create(outpath)    }
    #### updata Job_ID.txt, append a new job and state is downstreamRun ####
    Task_ID <- as.matrix(read.table(paste0(innerpath,"/","Job_ID.txt"),header = F,sep = "\t",check.names = F,fill = T))
    Task_ID_new <- rbind(Task_ID,c(ID,"userBulkdownstreamRun"))
    write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    ####1. load   methods ####
    source(paste0(innerpath,"/","resultFunctionMethod.R"))
    ######2.read base files #####
    expressionFile <- read.table(paste0(filePath,"/",ExpfileName),header = T,sep = "\t",as.is=TRUE,quote = "",row.names = 1,check.names = F)
    SampleNumAll<-dim(expressionFile)[2]
    GeneNumAll<-dim(expressionFile)[1]
    clinicalfile <- read.table(paste0(filePath,"/",clinicalfileName),header = T,sep = "\t",as.is=TRUE,quote = "",check.names = F)
    SampleFile_cancer=clinicalfile[which(clinicalfile$type=="cancer"),]
    SampleFile_cancer=SampleFile_cancer[,c("samplename","type","score")]
    ind_NA <- apply(SampleFile_cancer, 1, function(x){any(is.na(x))})
    SampleFile_cancer <- SampleFile_cancer[!ind_NA,]
    ###select cancer sample
    expressionFile<-expressionFile[,SampleFile_cancer$samplename]
    SampleNumCancer<-dim(expressionFile)[2]
    #####3.run ####
    
    csScore<-SampleFile_cancer[,c("samplename","score")]
    score_df<-data.frame(score=csScore$score)
    rownames(score_df)<-csScore$samplename
    
    
    ### 3.1 strem gene
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
      ####3.3survival
      
      clinical_infor=clinicalfile[which(clinicalfile$type=="cancer"),][,c("OS","OS.time")]
      rownames(clinical_infor)=clinicalfile[which(clinicalfile$type=="cancer"),]$samplename
      ind_NA <- apply(clinical_infor, 1, function(x){any(is.na(x))})
      clinical_infor<- clinical_infor[!ind_NA,]
      if(dim(clinical_infor)[1]==0){
        survival_infor<-"none"
      }else{
        survival_re<- survival_all(clinical_infor,csScore,outpath)
        survival_infor<-survival_re$survival_infor
        if (survival_infor=="yes"){
          survival_photo<-survival_re$survival_photo
          survival_logrank_p<-survival_re$survival_logrank_p
          survival_cox_p<-survival_re$survival_cox_p
          survival_cox_beta_v<-survival_re$survival_cox_beta_v
          survival_cox_beta_class<-survival_re$survival_cox_beta_class
          
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
        #####2. GSVA####
        genesetList=readRDS(paste0(innerpath,"/","GSVAgeneset.Rds"))
        geneset="Ben_ES_exp1"
        geneset_genes=genesetList[geneset]
        GSVA_geneset <- gsva(expr=as.matrix(expressionFile), 
                             gset.idx.list=geneset_genes, 
                             method="ssgsea")
        ###标准化到0-1之间
        score <- unname(GSVA_geneset[geneset,])
        score <- score - min(score)
        score <- score / max(score)
        CSscore_GSVA<-data.frame(samplename=colnames(GSVA_geneset),score=score)
        ###merge score###
        inter_sample=intersect(CSscore_GSVA$samplename,CSscore_mRNAsi$samplename)
        inter_sample=intersect(csScore$samplename,inter_sample)
        score_compare=data.frame(m1=csScore[which(csScore$samplename %in% inter_sample),2],
                                 m2=CSscore_mRNAsi[which(CSscore_mRNAsi$samplename %in% inter_sample),2],
                                 m3=CSscore_GSVA[which(CSscore_GSVA$samplename %in% inter_sample),2] )
        base_method="userUpload"
        colnames(score_compare)=c(base_method,"Supervised_mRNAsi","Unsupervised_GSVA")
        rownames(score_compare)=inter_sample
        
        methods_compare_re<-methods_compare_fun(score_compare,outpath)
        
      }
      
    }
    #####out
    stopMessage<-"no"
    method="userUpload"
    out_end <- paste0("{","\n",
                      '"dataType" :','"',type_m,'",',"\n",
                      '"method" :','"',method,'",',"\n",
                      '"JobID" :','"',ID,'",',"\n",
                      '"SampleNumAll" :','"',SampleNumAll,'",',"\n",
                      '"SampleNumCancer" :','"',SampleNumCancer,'",',"\n",
                      '"GeneNumAll" :','"',GeneNumAll,'",',"\n",
                      '"ExpfileName" :','"',ExpfileName,'",',"\n",
                      '"email_address" :','"',email_address,'",',"\n",
                      '"clinical" :','"',clinicalfileName,'",',"\n",
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
                      '"stopMessage" :','"',stopMessage,'"',"\n",
                      '}'
                      
    )
    write.table(out_end,paste0(outpath,"/","DownStream_re.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    Task_ID_new[which(Task_ID_new[,1]==ID),2] <- "userBulkdownstreamSuccess"
    write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    return(result_message)
    
    
    
    
  },error = function(e){
    stopMessage<-"something wrong"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    Task_ID_new[which(Task_ID_new[,1]==ID),2] <- "userBulkdownstreamDead"
    write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    return(result_message)
    
  })
}
