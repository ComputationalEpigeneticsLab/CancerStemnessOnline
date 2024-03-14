#ID_new:job id
#filePath:file path
#ExpfileName: Expression file name 
#SamplefileName: sample file name 
#innerpath:base file path
#geneset: user select geneset name
#method: user select method
#type:data type (bulk / single)
#email_address:user email_address
GSVACS<-function(ID_new,filePath,ExpfileName,SamplefileName,innerpath,geneset,method,type,email_address){
  suppressMessages({
    library(dplyr)
    library(jsonlite)
    library(stringr)
    library(GSVA)
  })
  ID_new<-ID_new
  filePath<-filePath
  innerpath<-innerpath
  ExpfileName<-ExpfileName
  SamplefileName<-SamplefileName
  geneset<-geneset
  method<-method
  type<-type
  email_address<-email_address
  
  
  tryCatch({
    #### updata Job_ID.txt, append a new job and state is run ####
    Task_ID <- as.matrix(read.table(paste0(innerpath,"/","Job_ID.txt"),header = F,sep = "\t",check.names = F,fill = T))
    Task_ID_new <- rbind(Task_ID,c(ID_new,"run"))
    write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    ####1. load   methods ####
    source(paste0(innerpath,"/","resultFunctionMethod.R"))
    genesetList=readRDS(paste0(innerpath,"/","GSVAgeneset.Rds"))
    ####2. read main file and pretreatment####
    ###expression file
    expressionFile <- read.table(paste0(filePath,"/",ExpfileName),header = T,sep = "\t",as.is=TRUE,quote = "",row.names = 1,check.names = F)
    SampleNumAll<-dim(expressionFile)[2]
    GeneNumAll<-dim(expressionFile)[1]
    ###Sample file
    SampleFile <- read.table(paste0(filePath,"/",SamplefileName),header = T,sep = "\t",as.is=TRUE,quote = "",check.names = F)
    colnames(SampleFile)<-c("samplename","type")
    SampleFile_cancer=SampleFile[which(SampleFile$type=="cancer"),]
    ###select cancer sample
    expressionFile<-expressionFile[,SampleFile_cancer$samplename]
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
    table_out<-sc_table_and_download(CSscore,filePath)
    CStable_webName<-table_out$cs_infor_web
    CStable_downloadName<-table_out$cs_infor_download
    ### barplot
    barplot_out<- classnumber10_function(CSscore$score)
    barplot_Num<-paste(barplot_out$barnum,collapse = ",")
    ### other base infor
    stopMessage<-"no"
    
    out_end <- paste0("{","\n",
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
                      '"stopMessage" :','"',stopMessage,'"',"\n",
                      '}'
                      
    )
    write.table(out_end,paste0(filePath,"/","CS_re.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    Task_ID_new[which(Task_ID_new[,1]==ID_new),2] <- "success"
    write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    return(result_message)
  },error = function(e){
    stopMessage<-"something wrong"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    Task_ID_new[which(Task_ID_new[,1]==ID_new),2] <- "dead"
    write.table(Task_ID_new,paste0(innerpath,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    return(result_message)
    
  })
  
  
  
}