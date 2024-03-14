

# ID<-"web-test"
# filePath="E:/0_webserve/4_example/single/web-test"
# innerpath="E:/0_webserve/2_methods/innerpath"
# corrThreshold=0.5
DownStreamSingle<-function(ID,filePath,innerpath,corrThreshold){
  suppressMessages({
    library(dplyr)
    library(jsonlite)
    library(stringr)
    library(psych)
    library(GSVA)
    library(ggplot2)
    library(pheatmap)
  })
  tryCatch({
  ID<-ID
  filePath<-filePath
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
  ###
  outpath<-paste0(filePath,"/DownStream")
  if(!dir.exists(outpath)){      dir.create(outpath)    }
  
  Task_ID <- as.matrix(read.table(paste0(innerpath,"/","Job_ID.txt"),header = F,sep = "\t",check.names = F,fill = T))
  Task_ID_state<-Task_ID[which(Task_ID[,1]==ID),2]
  Task_ID[which(Task_ID[,1]==ID),2] <- "downstreamSingleRun"
  
  
  ####1.read base infor #####
  source(paste0(innerpath,"/","resultFunctionMethod.R"))
  baseinfor_list=read_json(paste0(filePath,"/CS_re.txt"))
  csScore=read.table(paste0(filePath,"/CSscore_tableDownload.txt"),header = T,sep = "\t",as.is=TRUE,quote = "",check.names = F)
  expressionFile_all <- read.table(paste0(filePath,"/",baseinfor_list[["ExpfileName"]]),header = T,sep = "\t",as.is=TRUE,quote = "",row.names = 1,check.names = F)
  expressionFile<-expressionFile_all[,csScore$samplename]
  score_df<-read.table(paste0(filePath,"/CSscore_tableDownload.txt"),header = T,sep = "\t",as.is=TRUE,quote = "",check.names = F,row.names = 1)
  
  
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
    celltype_infor_all <- read.table(paste0(filePath,"/",baseinfor_list[["SamplefileName"]]),header = T,sep = "\t",as.is=TRUE,quote = "",row.names = 1,check.names = F)
    celltype_infor=data.frame(type=celltype_infor_all$type)
    ind_NA <- apply(celltype_infor, 1, function(x){any(is.na(x))})
    celltype_infor_all <- celltype_infor_all[!ind_NA,]
    celltype_infor=data.frame(type=celltype_infor_all$type)
    rownames(celltype_infor)=rownames(celltype_infor_all)
    
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
      celltalker_re= cell_cell_conminication_italktopgenes (df_use,meta,color_use,outpath,innerpath,baseinfor_list[["method"]])
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
    base_method=baseinfor_list$method
    colnames(score_compare)=c(base_method,"Supervised_StemSC","Unsupervised_CytoTRACE")
    rownames(score_compare)=inter_sample
    
    if (base_method =="StemSC"){
      score_compare=score_compare[,c(base_method,"Unsupervised_CytoTRACE")]
    }else if(base_method =="CytoTRACE"){
      score_compare=score_compare[,c(base_method,"Supervised_StemSC")]
    }
    
    methods_compare_re<-methods_compare_fun(score_compare,outpath)
    
    }
  #####out####
  stopMessage<-"no"
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
  Task_ID[which(Task_ID[,1]==ID),2] <- "downstreamSingleSuccess"
  write.table(Task_ID,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
  
  result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
  return(result_message)
  
  
  ######
  },error = function(e){
    stopMessage<-"something wrong"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    Task_ID[which(Task_ID[,1]==ID),2] <- "downstreamSingleDead"
    write.table(Task_ID,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    return(result_message)
    
  })
  
  
}
