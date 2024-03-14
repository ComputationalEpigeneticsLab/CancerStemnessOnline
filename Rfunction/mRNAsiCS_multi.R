#ID_new:job id
#filePath:file path
#ExpfileName: Expression file name 
#SamplefileName: sample file name 
#innerpath:base file path
#method: user select method
#type:data type (bulk / single)
#email_address:user email_address
mRNAsiCS<-function(Expfile,Samplefile,ExpfileName,SamplefileName,method,type,email_address,dir_out,ID_new,mRNAsi_model){
  suppressMessages({
    library(dplyr)
    library(jsonlite)
    library(stringr)
  })
  ID_new<-ID_new
  # filePath<-filePath
  # innerpath<-innerpath
  Expfile<-Expfile
  Samplefile<-Samplefile
  ExpfileName<-ExpfileName
  SamplefileName<-SamplefileName
  method<-method
  type<-type
  email_address<-email_address
  dir_out<-dir_out
  mRNAsi_model<-mRNAsi_model
  
  
  tryCatch({
    #### updata Job_ID.txt, append a new job and state is run ####
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
    common <- intersect(names(mRNAsi_model$w), rownames(expressionFile))
    X <- expressionFile[common, ]
    w <- mRNAsi_model$w[common]
    score <- apply(X, 2, function(z) {cor(z, w, method="sp", use="complete.obs")})
    score <- score - min(score)
    score <- score / max(score)
    CSscore<-data.frame(samplename=names(score),score=unname(score))
    
  ####4. out #####
    ### write cs score file 
    table_out<-sc_table_and_download(CSscore,dir_out)
    CStable_webName<-table_out$cs_infor_web
    CStable_downloadName<-table_out$cs_infor_download
    ### barplot
    barplot_out<- classnumber10_function(CSscore$score)
    barplot_Num<-paste(barplot_out$barnum,collapse = ",")
    ####sample infor ####
    use_col<-c("samplename","treatment_history","tumor_stage","sex","smoke_history","alcohol_history","demographic")
    pie_violin_re<-pie_violin_class_plot(SampleFile_use,CSscore,dir_out,use_col)
    use_col<-c("samplename","diagnosis_age","TMB","Mutation")
    bar_scatter_re=bar_scatter_plot(SampleFile_use,CSscore,dir_out,use_col)
    
    
    
    ### other base infor
    stopMessage<-"no"
    
    out_end <- paste0("{","\n",
                    '"dataType" :','"',type,'",',"\n",
                    '"method" :','"',method,'",',"\n",
                    '"JobID" :','"',ID_new,'",',"\n",
                    '"SampleNumAll" :','"',SampleNumAll,'",',"\n",
                    '"SampleNumCancer" :','"',SampleNumCancer,'",',"\n",
                    '"GeneNumAll" :','"',GeneNumAll,'",',"\n",
                    '"CStable_webName" :','"',CStable_webName,'",',"\n",
                    '"CStable_downloadName" :','"',CStable_downloadName,'",',"\n",
                    '"barplot_Num" :','"',barplot_Num,'",',"\n",
                    '"ExpfileName" :','"',ExpfileName,'",',"\n",
                    '"SamplefileName" :','"',SamplefileName,'",',"\n",
                    '"email_address" :','"',email_address,'",',"\n",
                    '"treatment_history_error" :','"',pie_violin_re$treatment_history$err_attention,'",',"\n",
                    '"treatment_history_color" :','"',pie_violin_re$treatment_history$colors_u,'",',"\n",
                    '"treatment_history_label" :','"',pie_violin_re$treatment_history$labels_u,'",',"\n",
                    '"treatment_history_value_pie" :','"',pie_violin_re$treatment_history$value_pie,'",',"\n",
                    '"treatment_history_violin_filename" :','"',pie_violin_re$treatment_history$violin_filename,'",',"\n",
                    '"tumor_stage_error" :','"',pie_violin_re$tumor_stage$err_attention,'",',"\n",
                    '"tumor_stage_color" :','"',pie_violin_re$tumor_stage$colors_u,'",',"\n",
                    '"tumor_stage_label" :','"',pie_violin_re$tumor_stage$labels_u,'",',"\n",
                    '"tumor_stage_value_pie" :','"',pie_violin_re$tumor_stage$value_pie,'",',"\n",
                    '"tumor_stage_violin_filename" :','"',pie_violin_re$tumor_stage$violin_filename,'",',"\n",
                    '"sex_error" :','"',pie_violin_re$sex$err_attention,'",',"\n",
                    '"sex_color" :','"',pie_violin_re$sex$colors_u,'",',"\n",
                    '"sex_label" :','"',pie_violin_re$sex$labels_u,'",',"\n",
                    '"sex_value_pie" :','"',pie_violin_re$sex$value_pie,'",',"\n",
                    '"sex_violin_filename" :','"',pie_violin_re$sex$violin_filename,'",',"\n",
                    '"smoke_history_error" :','"',pie_violin_re$smoke_history$err_attention,'",',"\n",
                    '"smoke_history_color" :','"',pie_violin_re$smoke_history$colors_u,'",',"\n",
                    '"smoke_history_label" :','"',pie_violin_re$smoke_history$labels_u,'",',"\n",
                    '"smoke_history_value_pie" :','"',pie_violin_re$smoke_history$value_pie,'",',"\n",
                    '"smoke_history_violin_filename" :','"',pie_violin_re$smoke_history$violin_filename,'",',"\n",
                    '"alcohol_history_error" :','"',pie_violin_re$alcohol_history$err_attention,'",',"\n",
                    '"alcohol_history_color" :','"',pie_violin_re$alcohol_history$colors_u,'",',"\n",
                    '"alcohol_history_label" :','"',pie_violin_re$alcohol_history$labels_u,'",',"\n",
                    '"alcohol_history_value_pie" :','"',pie_violin_re$alcohol_history$value_pie,'",',"\n",
                    '"alcohol_history_violin_filename" :','"',pie_violin_re$alcohol_history$violin_filename,'",',"\n",
                    '"demographic_error" :','"',pie_violin_re$demographic$err_attention,'",',"\n",
                    '"demographic_color" :','"',pie_violin_re$demographic$colors_u,'",',"\n",
                    '"demographic_label" :','"',pie_violin_re$demographic$labels_u,'",',"\n",
                    '"demographic_value_pie" :','"',pie_violin_re$demographic$value_pie,'",',"\n",
                    '"demographic_violin_filename" :','"',pie_violin_re$demographic$violin_filename,'",',"\n",
                    '"diagnosis_age_error" :','"',bar_scatter_re$diagnosis_age$err_attention,'",',"\n",
                    '"diagnosis_age_label" :','"',bar_scatter_re$diagnosis_age$col0_labels,'",',"\n",
                    '"diagnosis_age_value" :','"',bar_scatter_re$diagnosis_age$col0_value,'",',"\n",
                    '"diagnosis_age_scatter_p" :','"',bar_scatter_re$diagnosis_age$col0_photo,'",',"\n",
                    '"TMB_error" :','"',bar_scatter_re$TMB$err_attention,'",',"\n",
                    '"TMB_label" :','"',bar_scatter_re$TMB$col0_labels,'",',"\n",
                    '"TMB_value" :','"',bar_scatter_re$TMB$col0_value,'",',"\n",
                    '"TMB_scatter_p" :','"',bar_scatter_re$TMB$col0_photo,'",',"\n",
                    '"Mutation_error" :','"',bar_scatter_re$Mutation$err_attention,'",',"\n",
                    '"Mutation_label" :','"',bar_scatter_re$Mutation$col0_labels,'",',"\n",
                    '"Mutation_value" :','"',bar_scatter_re$Mutation$col0_value,'",',"\n",
                    '"Mutation_scatter_p" :','"',bar_scatter_re$Mutation$col0_photo,'",',"\n",
                    '"stopMessage" :','"',stopMessage,'"',"\n",
                    '}'
                    
    )
    write.table(out_end,paste0(dir_out,"/","CS_re.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    # Task_ID_new[which(Task_ID_new[,1]==ID_new),2] <- "success"
    # write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    return(CSscore)
  },error = function(e){
    stopMessage<-"mRNAsi cannot be calculated"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    write.table(stopMessage,paste0(dir_out,"/stopMessage_mRNAsi.txt"),
                quote = F,sep = "\t",row.names = F,col.names = F)
    re_stop<-"no_result"
    return(re_stop)
    
  })
  

  
}