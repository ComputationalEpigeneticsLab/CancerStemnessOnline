
# ID="single_user"
# filePath="E:/0_webserve/4_example/single/userUpload"
# ExpfileName="GSE84465_TPM_use.txt"
# clinicalfileName="GSE84465_feature_use.txt"
# innerpath<-"E:/0_webserve/2_methods/innerpath"
# corrThreshold<-0.5
# email_address<-"aaaa"

DownStreamSingleUser<-function(ID,filePath,ExpfileName,clinicalfileName,innerpath,corrThreshold,email_address){
  
  suppressMessages({
    library(dplyr)
    library(jsonlite)
    library(stringr)
    library(psych)
    library(GSVA)
    library(ggplot2)
    library(pheatmap)
  })
  
  ID=ID
  ExpfileName=ExpfileName
  clinicalfileName=clinicalfileName
  innerpath=innerpath
  corrThreshold=corrThreshold
  email_address=email_address
  type_m<-"single"
  
  corr_re_table_web<-"none"
  corr_re_table_download<-"none"
  steam_gene_top_heatmap<-"none"
  gene_heatmap_all_heatmap<-"none"
  hallmarker_infor_web<-"none"
  hallmarker_infor_download<-"none"
  hallmarker_heatmap_web<-"none"
  hallmarker_corr_web<-"none"
  
  tryCatch({
    outpath<-paste0(filePath,"/DownStream")
    if(!dir.exists(outpath)){      dir.create(outpath)    }
    #### updata Job_ID.txt, append a new job and state is downstreamRun ####
    Task_ID <- as.matrix(read.table(paste0(innerpath,"/","Job_ID.txt"),header = F,sep = "\t",check.names = F,fill = T))
    Task_ID_new <- rbind(Task_ID,c(ID,"userSingledownstreamRun"))
    write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    
    ####1. load   methods ####
    source(paste0(innerpath,"/","resultFunctionMethod.R"))
    ######2.read base files #####
    expressionFile_all <- read.table(paste0(filePath,"/",ExpfileName),header = T,sep = "\t",as.is=TRUE,quote = "",row.names = 1,check.names = F)
    SampleNumAll<-dim(expressionFile_all)[2]
    GeneNumAll<-dim(expressionFile_all)[1]
    clinicalfile <- read.table(paste0(filePath,"/",clinicalfileName),header = T,sep = "\t",as.is=TRUE,quote = "",check.names = F)
    SampleFile_cancer=clinicalfile[which(clinicalfile$type=="cancer"),]
    SampleFile_cancer=SampleFile_cancer[,c("samplename","type","score")]
    ind_NA <- apply(SampleFile_cancer, 1, function(x){any(is.na(x))})
    SampleFile_cancer <- SampleFile_cancer[!ind_NA,]
    
    ###select cancer sample
    expressionFile<-expressionFile_all[,SampleFile_cancer$samplename]
    SampleNumCancer<-dim(expressionFile)[2]
    #####3.run ####
    csScore<-SampleFile_cancer[,c("samplename","score")]
    score_df<-data.frame(score=csScore$score)
    rownames(score_df)<-csScore$samplename
    
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
      g_n=length(sig_gene)
      if(g_n>=50){g_n=50}
      stem_gene_heatmap_re<-stem_gene_heatmap(expressionFile,csScore,sig_gene,g_n,outpath)
      steam_gene_top_heatmap<-stem_gene_heatmap_re$steam_gene_top
      gene_heatmap_all_heatmap<-stem_gene_heatmap_re$steam_gene_all
      ####gene Rtsne expression###
      strem_gene_tsne_re=strem_gene_tsne_meanEXP(expressionFile,sig_gene,outpath,score_df)
      #### function enrich #####
      hallmarker_re<-gsva_pathway(expressionFile,score_df,sig_gene,"cancerhallmark",corrThreshold,outpath,innerpath)
      hallmarker_success<-hallmarker_re$hallmarker_success
      if (hallmarker_success=="yes"){
        hallmarker_infor_web<-hallmarker_re$hallmarker_infor_web
        hallmarker_infor_download<-hallmarker_re$hallmarker_infor_download
        hallmarker_heatmap_web<-hallmarker_re$hallmarker_heatmap_web
        hallmarker_corr_web<-hallmarker_re$hallmarker_corr_web
      }
      imm_re=gsva_pathway2(expressionFile,score_df,sig_gene,"immue",corrThreshold,outpath,innerpath)
      cellstat_re=gsva_pathway2(expressionFile,score_df,sig_gene,"cellstat",corrThreshold,outpath,innerpath)
      
      
      ####cell cell comm ####
      #celltype_infor_all <- read.table(paste0(filePath,"/",baseinfor_list[["SamplefileName"]]),header = T,sep = "\t",as.is=TRUE,quote = "",row.names = 1,check.names = F)
      celltype_infor_all<-clinicalfile
      celltype_infor=data.frame(type=celltype_infor_all$type)
      ind_NA <- apply(celltype_infor, 1, function(x){any(is.na(x))})
      celltype_infor_all <- celltype_infor_all[!ind_NA,]
      celltype_infor=data.frame(type=celltype_infor_all$type)
      rownames(celltype_infor)=celltype_infor_all$samplename
      
      celltype_u=unique(celltype_infor$type)
      if(length(celltype_u)>1){
        cell_cell_infor="yes"
        color_all<-c("#ADD6AB","#E78487","#E4BCB9","#8CC1D6","#BDDCBA","#FC733D","#F4D6D3","#F3CAB9","#A7C199","#ADD6AB","#E78487","#E4BCB9","#8CC1D6","#BDDCBA","#FC733D","#F4D6D3","#F3CAB9","#A7C199")
        
        
        meta=data.frame(cell=rownames(celltype_infor),cell_type=celltype_infor$type)
        rownames(meta)=rownames(celltype_infor)
        
        csScore<-csScore[order(csScore$score,decreasing = T),]
        cancer_stem_cells=csScore$samplename[1:ceiling(dim(csScore)[1]/10)]
        meta1=meta[which(meta$cell_type!="cancer"),]
        mata2=data.frame(cell=cancer_stem_cells,cell_type=rep("CancerStemCell",length(cancer_stem_cells)))
        rownames(mata2)=cancer_stem_cells
        meta=rbind(meta1,mata2)   
        celltype_u=unique(meta$cell_type)
        color_use=data.frame(V1=color_all[1:length(celltype_u)])
        rownames(color_use)=celltype_u
        color_use=as.matrix(color_use)
        df_use=expressionFile_all[,rownames(meta)]
        celltalker_re= cell_cell_conminication_italktopgenes (df_use,meta,color_use,outpath,innerpath,"user")
        if(celltalker_re$error_attention=="error_attention: no"){
          celltalker_error_attention<-"no"
          celltalker_circos_file<-celltalker_re$Res_circos_file
          celltalker_circos_color<-celltalker_re$Res_circos_color
          celltalker_tablefile_web<-celltalker_re$Res_tablefile
          celltalker_download_table<-celltalker_re$download_table
          celltalker_riverplot_file<-celltalker_re$Res_riverplot_file
        }else{
          celltalker_circos_file=celltalker_circos_color=celltalker_tablefile_web=celltalker_download_table=celltalker_riverplot_file="none"
          celltalker_error_attention<-"yes"
        }
      }else{
        cell_cell_infor="no"
      }
      #####compare with other####
      methods_compare=c("StemSC","CytoTRACE")
      source(paste0(innerpath,"/","all_FUN.R"))
      load(paste0(innerpath,"/","gene_pairs_SYMBOL_StemSC.RData"))
      #####StemSC####
      score<-StemSC(expressionFile,pairs = gene_pairs_SYMBOL_StemSC)
      CSscore_StemSC<-data.frame(samplename=names(score),score=unname(score))
      
      #####2. CytoTRACE####
      
      score<-CytoTRACE(expressionFile)
      CSscore_CytoTRACE<-data.frame(samplename=names(score$CytoTRACE),score=unname(score$CytoTRACE))
      ###merge score###
      inter_sample=intersect(CSscore_CytoTRACE$samplename,CSscore_StemSC$samplename)
      inter_sample=intersect(csScore$samplename,inter_sample)
      score_compare=data.frame(m1=csScore[which(csScore$samplename %in% inter_sample),2],
                               m2=CSscore_StemSC[which(CSscore_StemSC$samplename %in% inter_sample),2],
                               m3=CSscore_CytoTRACE[which(CSscore_CytoTRACE$samplename %in% inter_sample),2] )
      base_method="user"
      colnames(score_compare)=c(base_method,"Supervised_StemSC","Unsupervised_CytoTRACE")
      rownames(score_compare)=inter_sample
      methods_compare_re<-methods_compare_fun(score_compare,outpath)
      
      
    }
    
    ######
    stopMessage<-"no"
    method="user"
    
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
                      '"CSgene_exp_tsne" :','"',strem_gene_tsne_re$CSgene_exp_tsne,'",',"\n",
                      '"CSgene_exp_tsne_error" :','"',strem_gene_tsne_re$CSgene_exp_tsne_error,'",',"\n",
                      '"CSgene_score_tsne" :','"',strem_gene_tsne_re$CSgene_score_tsne,'",',"\n",
                      '"CSgene_tsne_pca_file" :','"',strem_gene_tsne_re$CSgene_tsne_tsne,'",',"\n",
                      '"hallmarker_success" :','"',hallmarker_success,'",',"\n",
                      '"hallmarker_infor_web" :','"',hallmarker_infor_web,'",',"\n",
                      '"hallmarker_infor_download" :','"',hallmarker_infor_download,'",',"\n",
                      '"hallmarker_heatmap_web" :','"',hallmarker_heatmap_web,'",',"\n",
                      '"hallmarker_corr_web" :','"',hallmarker_corr_web,'",',"\n",
                      '"imm_success" :','"',imm_re$hallmarker_success,'",',"\n",
                      '"imm_infor_web" :','"',imm_re$hallmarker_infor_web,'",',"\n",
                      '"imm_infor_download" :','"',imm_re$hallmarker_infor_download,'",',"\n",
                      '"imm_heatmap_web" :','"',imm_re$hallmarker_heatmap_web,'",',"\n",
                      '"imm_corr_web" :','"',imm_re$hallmarker_corr_web,'",',"\n",
                      '"cellstat_success" :','"',cellstat_re$hallmarker_success,'",',"\n",
                      '"cellstat_infor_web" :','"',cellstat_re$hallmarker_infor_web,'",',"\n",
                      '"cellstat_infor_download" :','"',cellstat_re$hallmarker_infor_download,'",',"\n",
                      '"cellstat_heatmap_web" :','"',cellstat_re$hallmarker_heatmap_web,'",',"\n",
                      '"cellstat_corr_web" :','"',cellstat_re$hallmarker_corr_web,'",',"\n",
                      '"compare_score_error" :','"',methods_compare_re$error_attention_table,'",',"\n",
                      '"compare_score_download" :','"',methods_compare_re$compare_score_download,'",',"\n",
                      '"compare_score_web" :','"',methods_compare_re$compare_score_web,'",',"\n",
                      '"compare_corr_download" :','"',methods_compare_re$compare_corr_download,'",',"\n",
                      '"compare_corr_web" :','"',methods_compare_re$compare_corr_web,'",',"\n",
                      '"cell_cell_infor" :','"',cell_cell_infor,'",',"\n",
                      '"celltalker_error_attention" :','"',celltalker_error_attention,'",',"\n",
                      '"celltalker_circos_file" :','"',celltalker_circos_file,'",',"\n",
                      '"celltalker_circos_color" :','"',celltalker_circos_color,'",',"\n",
                      '"celltalker_tablefile_web" :','"',celltalker_tablefile_web,'",',"\n",
                      '"celltalker_download_table" :','"',celltalker_download_table,'",',"\n",
                      '"celltalker_riverplot_file" :','"',celltalker_riverplot_file,'",',"\n",
                      '"stopMessage" :','"',stopMessage,'"',"\n",
                      '}'
                      
    )
    write.table(out_end,paste0(outpath,"/","DownStream_re.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    Task_ID_new[which(Task_ID_new[,1]==ID),2] <- "userSingledownstreamSuccess"
    write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    return(result_message)
    
    
    
  },error = function(e){
    stopMessage<-"something wrong"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    Task_ID_new[which(Task_ID_new[,1]==ID),2] <- "userSingledownstreamDead"
    write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    return(result_message)
    
  })
  
}
