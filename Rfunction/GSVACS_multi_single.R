#ID_new:job id
#filePath:file path
#ExpfileName: Expression file name 
#SamplefileName: sample file name 
#innerpath:base file path
#geneset: user select geneset name
#method: user select method
#type:data type (bulk / single)
#email_address:user email_address
GSVACS<-function(Expfile,Samplefile,ExpfileName,SamplefileName,geneset,method,type,email_address,dir_out,ID_new,RNA_v,genesetList){
  suppressMessages({
    library(dplyr)
    library(jsonlite)
    library(stringr)
    library(GSVA)
  })
  ID_new<-ID_new
  # filePath<-filePath
  # innerpath<-innerpath
  Expfile<-Expfile
  Samplefile<-Samplefile
  ExpfileName<-ExpfileName
  SamplefileName<-SamplefileName
  geneset<-geneset
  method<-method
  type<-type
  email_address<-email_address
  dir_out<-dir_out
  RNA_v<-RNA_v
  genesetList<-genesetList
  
  tryCatch({
    expressionFile <- Expfile
    SampleNumAll<-dim(expressionFile)[2]
    GeneNumAll<-dim(expressionFile)[1]
    ###Sample file
    SampleFile <- Samplefile
    #SampleFile_cancer=SampleFile[which(SampleFile$type=="cancer"),][,c("samplename","type")]
    SampleFile_use=SampleFile[which(SampleFile[,2]=="cancer"),]
    ###select cancer sample
    expressionFile<-expressionFile[,SampleFile_use[,1]]
    SampleNumCancer<-dim(expressionFile)[2]
    ####3. CS score ######
    geneset_genes=genesetList[geneset]
    GSVA_geneset <- gsva(expr=as.matrix(expressionFile), 
                         gset.idx.list=geneset_genes, 
                         method="ssgsea")
    ###标准化到0-1之间
    score <- unname(GSVA_geneset[geneset,])
    score <- score - min(score)
    score <- score / max(score)
    CSscore<-data.frame(samplename=colnames(GSVA_geneset),score=score)
    ####4. out #####
    ### write cs score file 
    table_out<-sc_table_and_download(CSscore,dir_out)
    CStable_webName<-table_out$cs_infor_web
    CStable_downloadName<-table_out$cs_infor_download
    ### barplot
    barplot_out<- classnumber10_function(CSscore$score)
    barplot_Num<-paste(barplot_out$barnum,collapse = ",")
    
    ####sample infor ####
    #use_col<-colnames(SampleFile_use)
    use_col<-c("samplename","Sample_source","Drug_treatment")
    pie_violin_re<-pie_violin_class_plot(SampleFile_use,CSscore,dir_out,use_col)
    ### other base infor
    stopMessage<-"no"
    
    out_end <- paste0("{","\n",
                      '"RNA_v" :','"',RNA_v,'"',',','\n',
                      '"dataType" :','"',type,'",',"\n",
                      '"method" :','"',method,'",',"\n",
                      '"JobID" :','"',ID_new,'",',"\n",
                      '"geneset" :','"',geneset,'",',"\n",
                      '"SampleNumAll" :','"',SampleNumAll,'",',"\n",
                      '"SampleNumCancer" :','"',SampleNumCancer,'",',"\n",
                      '"GeneNumAll" :','"',GeneNumAll,'",',"\n",
                      '"CStable_webName" :','"',CStable_webName,'",',"\n",
                      '"CStable_downloadName" :','"',CStable_downloadName,'",',"\n",
                      '"barplot_Num" :','"',barplot_Num,'",',"\n",
                      '"ExpfileName" :','"',ExpfileName,'",',"\n",
                      '"SamplefileName" :','"',SamplefileName,'",',"\n",
                      '"email_address" :','"',email_address,'",',"\n",
                      '"Sample_source_error" :','"',pie_violin_re$Sample_source$err_attention,'",',"\n",
                      '"Sample_source_color" :','"',pie_violin_re$Sample_source$colors_u,'",',"\n",
                      '"Sample_source_label" :','"',pie_violin_re$Sample_source$labels_u,'",',"\n",
                      '"Sample_source_value_pie" :','"',pie_violin_re$Sample_source$value_pie,'",',"\n",
                      '"Sample_source_violin_filename" :','"',pie_violin_re$Sample_source$violin_filename,'",',"\n",
                      '"Drug_treatment_error" :','"',pie_violin_re$Drug_treatment$err_attention,'",',"\n",
                      '"Drug_treatment_color" :','"',pie_violin_re$Drug_treatment$colors_u,'",',"\n",
                      '"Drug_treatment_label" :','"',pie_violin_re$Drug_treatment$labels_u,'",',"\n",
                      '"Drug_treatment_value_pie" :','"',pie_violin_re$Drug_treatment$value_pie,'",',"\n",
                      '"Drug_treatment_violin_filename" :','"',pie_violin_re$Drug_treatment$violin_filename,'",',"\n",
                      '"stopMessage" :','"',stopMessage,'"',"\n",
                      '}'
                      
    )
    write.table(out_end,paste0(dir_out,"/","CS_re.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    # Task_ID_new[which(Task_ID_new[,1]==ID_new),2] <- "success"
    # write.table(Task_ID_new,paste0(dir_out,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    return(CSscore)
  },error = function(e){
    stopMessage<-"GSVA cannot be calculated"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    write.table(stopMessage,paste0(dir_out,"/stopMessage_GSVA.txt"),
                quote = F,sep = "\t",row.names = F,col.names = F)
    re_stop<-"no_result"
    return(re_stop)
    # Task_ID_new[which(Task_ID_new[,1]==ID_new),2] <- "dead"
    # write.table(Task_ID_new,paste0(dir_out,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    
  })
  
  
  
}