#ID_new:job id
#filePath:file path
#ExpfileName: Expression file name 
#SamplefileName: sample file name 
#innerpath:base file path
#method: user select method
#type:data type (bulk / single)
#email_address:user email_address
StemIDCS<-function(Expfile,Samplefile,ExpfileName,SamplefileName,method,type,email_address,dir_out,ID_new,RNA_v){
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
  RNA_v<-RNA_v
  
  tryCatch({
    #### updata Job_ID.txt, append a new job and state is run ####
    # Task_ID <- as.matrix(read.table(paste0(innerpath,"/","Job_ID.txt"),header = F,sep = "\t",check.names = F,fill = T))
    # Task_ID_new <- rbind(Task_ID,c(ID_new,"run"))
    # write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    ####1. load   methods ####
    # source(paste0(innerpath,"/","all_FUN.R"))
    # source(paste0(innerpath,"/","resultFunctionMethod.R"))
    ####2. read main file and pretreatment####
    ###expression file
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
    x<-expressionFile
    prdata <- x[grep("ERCC",rownames(x),invert=TRUE),]
    sc <- SCseq(prdata)
    sc <- filterdata(sc, mintotal=1000, minexpr=1, minnumber=1, maxexpr=1000, downsample=TRUE, dsn=1, rseed=17000)
    sc <- clustexp(sc,clustnr=20,bootnr=50,metric="pearson",do.gap=FALSE,sat=TRUE,SE.method="Tibs2001SEmax",
                   SE.factor=.25,B.gap=50,cln=0,rseed=17000,FUNcluster="kmedoids")
    sc <- comptsne(sc,rseed=15555)
    sc <- findoutliers(sc, outminc=5,outlg=2,probthr=1e-3,thr=2**-(1:40),outdistquant=.95)
    ltr <- Ltree(sc)
    ltr <- compentropy(ltr)
    ltr <- projcells(ltr,cthr=2,nmode=FALSE)
    ltr <- projback(ltr,pdishuf=1000,nmode=FALSE,rseed=17000)
    ltr <- lineagetree(ltr,pthr=0.01,nmode=FALSE)
    ltr <- comppvalue(ltr,pethr=0.01,nmode=FALSE)
    StemID_result <- compscore(ltr,nn=1)
    
    StemID_score<-as.data.frame(ltr@sc@cpart)
    colnames(StemID_score)<-"cluster"
    StemID_score$sample<-rownames(StemID_score)
    
    StemIDscore<-StemID_result$StemIDscore
    names(StemIDscore)<-unlist(lapply(strsplit(names(StemIDscore),"\\."),function(x){return(x[2])}))
    StemIDscore<-StemIDscore[order(names(StemIDscore))]
    
    StemID_score<-StemID_score[which(StemID_score$cluster%in%names(StemIDscore)),]
    StemID_score<-StemID_score[order(StemID_score$cluster),]
    StemID_score$StemID_score<-rep(StemIDscore,table(StemID_score$cluster))
    
    score<-StemID_score$StemID_score
    score <- score - min(score)
    score <- score / ifelse(max(score)>0,max(score),1)
    CSscore<-data.frame(samplename=rownames(StemID_score),score=score)
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
    # write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    return(CSscore)
  },error = function(e){
    stopMessage<-"StemID cannot be calculated"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    write.table(stopMessage,paste0(dir_out,"/stopMessage_StemID.txt"),
                quote = F,sep = "\t",row.names = F,col.names = F)
    re_stop<-"no_result"
    return(re_stop)
    # Task_ID_new[which(Task_ID_new[,1]==ID_new),2] <- "dead"
    # write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    
  })
  
  
  
}