###UserTaskID: 用户ID
###fileNameEXP: 表达谱,不要log化,行名是基因名,列名是样本名
###fileNameSample: 样本信息,两列，第一列是样本或细胞,第二列是cancer或normal分类
###email_address: 邮件地址
###file_in: 文件输入地址
###file_out: 文件输出地址
###methods: 想要计算的干性得分(CytoTRACE,SLICE,SCENT,StemID,StemSC,StemnessIndex,mRNAsi,GSVA)
###filetype: 表达谱的类型(count,FPKM,TPM)
###datatype: 数据类型(single,bulk)
###genome: 参考基因组版本(hg19,hg38)
###all_geneset: GSVA的基因集名字(27个基因集的名字)

##################################################
all_stemness<-function(UserTaskID,
                       externalData_dir,###各种方法需要的参考数据或基因集存储路径
                       dir_scoreCS,###各种干性计算函数all_FUN.R,CytoTRACECS_multi.R...存储路径
                       fileNameEXP,
                       fileNameSample,
                       file_in,
                       email_address,
                       file_out,
                       methods,
                       filetype,
                       datatype,
                       genome,
                       all_geneset){
 tryCatch({
 #### updata Job_ID.txt, append a new job and state is run ####
    Task_ID <- as.matrix(read.table(paste0(externalData_dir,"/","Job_ID.txt"),header = F,sep = "\t",check.names = F,fill = T))
    Task_ID_new <- rbind(Task_ID,c(UserTaskID,"run_mult"))
    write.table(Task_ID_new,paste0(externalData_dir,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
  RNA_v<-"no"
  
  externalData_dir=externalData_dir###all_geneset: GSVA的基因集名字(27个基因集的名字)
  genesetList<-readRDS(paste0(externalData_dir,"/","GSVAgeneset.Rds"))####GSVA用
  geneset_names<-names(genesetList)
  load(paste0(externalData_dir,"/hs_km.RData"))
  hs_km<-km###SLICE时用
  load(paste0(externalData_dir,"/gene_pairs_SYMBOL_StemSC.RData"))###StemSC时用
  load(paste0(externalData_dir,"/PPI_net17Jan16.RData"))###SCENT时用
  load(paste0(externalData_dir,"/gene_pairs_SYMBOL_StemnessIndex.RData"))###StemnessIndex时用
  mRNAsi_model<-readRDS(paste0(externalData_dir,"/model.RNA_test.Rds"))###mRNAsi用
  
  ###参考基因组 hg19和hg38 包含两列：symbol(基因名)和length(基因长度)
  ref_genome_19<-read.delim(paste0(externalData_dir,"/","gene_length_symbol_hg19.txt"),stringsAsFactors = F,check.names = F)
  ref_genome_38<-read.delim(paste0(externalData_dir,"/","gene_length_symbol_GRCh38.txt"),stringsAsFactors = F,check.names = F)
  
  source(paste0(externalData_dir,"/","all_FUN.R"))
  source(paste0(externalData_dir,"/","resultFunctionMethod.R"))
  #dir_scoreCS<-externalData_dir
  
  library(dplyr)
  library(tidyverse)
  library(magrittr)
  library(Seurat)
  library(monocle)
  library(igraph)
  library(RobustRankAggreg)
  library(jsonlite)
  
  stopMessage_aaa<-"run"
  if(!dir.exists(file_out)) dir.create(file_out)
  all_methods<-unlist(strsplit(methods,","))
  all_geneset<-unlist(strsplit(all_geneset,","))
  
  file_EXP<-read.delim(paste0(file_in,"/",fileNameEXP),stringsAsFactors = F,check.names = F)
  file_Sample<-read.delim(paste0(file_in,"/",fileNameSample),stringsAsFactors = F,check.names = F)
  
  file_EXP <- file_EXP[grep("ERCC",rownames(file_EXP),invert=TRUE),]
  
  file_EXP<-file_EXP[rowSums(file_EXP)>0,]
  file_EXP<-file_EXP[,colSums(file_EXP)>0]
  inte_sample<-intersect(colnames(file_EXP),file_Sample[,1])
  file_EXP<-file_EXP[,inte_sample]
  file_Sample<-file_Sample[match(inte_sample,file_Sample[,1]),]
  
  ###1. 数据转换,count和FPKM都转为TPM
  tryCatch({
    if(filetype=="TPM"){
      TPM_data<-file_EXP%>%as.matrix()%>%as.data.frame()
    }else if(filetype=="count"){
      ###count转TPM
      dat<-as.data.frame(apply(file_EXP,2,as.numeric))
      dat$symbol<-rownames(file_EXP)
      dat<-dat[,c(ncol(dat),1:(ncol(dat)-1))]
      
      if(genome=="hg19"){
        tmp <- inner_join(dat,ref_genome_19,by = 'symbol') # 匹配gene_count与gene_length
        # count2tpm
        tpm <- data.frame(row.names = tmp$symbol)
        for (i in 2:(dim(tmp)[2]-1)){
          col <- tmp[[i]]
          len <- tmp[[dim(tmp)[2]]]
          rate <- col/len
          N <- sum(col) # 计算每个样本的mapped reads数
          TPMi <- (rate*1e6)/(sum(rate)) # 计算tpm值
          TPMi <- pmax(TPMi,0) %>% as.data.frame() # 去掉矫正带来的负值
          colnames(TPMi) <- colnames(tmp)[i]
          tpm <- cbind(tpm,TPMi)
          
        }
        TPM_data<-tpm%>%as.matrix()%>%as.data.frame()
        print("countToTPM:hg19")
      }else if(genome=="hg38"){
        tmp <- inner_join(dat,ref_genome_38,by = 'symbol') # 匹配gene_count与gene_length
        # count2tpm
        tpm <- data.frame(row.names = tmp$symbol)
        for (i in 2:(dim(tmp)[2]-1)){
          col <- tmp[[i]]
          len <- tmp[[dim(tmp)[2]]]
          rate <- col/len
          N <- sum(col) # 计算每个样本的mapped reads数
          TPMi <- (rate*1e6)/(sum(rate)) # 计算tpm值
          TPMi <- pmax(TPMi,0) %>% as.data.frame() # 去掉矫正带来的负值
          colnames(TPMi) <- colnames(tmp)[i]
          tpm <- cbind(tpm,TPMi)
        }
        TPM_data<-tpm%>%as.matrix()%>%as.data.frame()
        print("countToTPM:hg38")
      }
      
    }else{
      ###FPKM转TPM
      FPKMtoTPM <- function(x) {
        return(exp(log(x) - log(sum(x)) + log(1e6)))
      }
      dat<-as.data.frame(apply(file_EXP,2,as.numeric))
      TPM_data<-apply(dat,2,FPKMtoTPM)%>%as.matrix()%>%as.data.frame()
      rownames(TPM_data)<-rownames(file_EXP)
      print("FPKMtoTPM")
    }
  },error = function(e){
    stopMessage_aaa<-"Unable to convert data"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage_aaa,'"}')
    write.table(stopMessage_aaa,paste0(file_out,"/stopMessage_convert.txt"),
                quote = F,sep = "\t",row.names = F,col.names = F)
    return(result_message)
  })
  
  ###判断并补充bulk的"treatment_history","tumor_stage","sex","smoke_history","alcohol_history","demographic","diagnosis_age","TMB","Mutation"
  ###single的"Sample_source","Drug_treatment"
  bulk_colnames<-c('diagnosis_age',	'treatment_history',	'demographic',	'tumor_stage',	
                   'sex',	'TMB',	'Mutation',	'smoke_history',	'alcohol_history')
  single_colnames<-c('Sample_source',	'Drug_treatment')
  
  if("GSVA"%in%all_methods&&length(all_geneset)>0){
    GSVA_all_geneset<-paste0("GSVA_",all_geneset)
    sample_lab<-rep("no",(length(all_methods)-1+length(all_geneset)))
    names(sample_lab)<-c(setdiff(all_methods,"GSVA"),GSVA_all_geneset)
  }else{
    sample_lab<-rep("no",length(setdiff(all_methods,"GSVA")))
    names(sample_lab)<-setdiff(all_methods,"GSVA")
  }

  
  single_col<-length(intersect(colnames(file_Sample),single_colnames))
  bulk_col<-length(intersect(colnames(file_Sample),bulk_colnames))
  if(datatype=="single"&&single_col>=1){
    sample_lab[!names(sample_lab)%in%c('StemnessIndex','mRNAsi')]<-"yes"
  }
  #methods="CytoTRACE,SLICE,SCENT,StemID,StemSC,GSVA,StemnessIndex,mRNAsi"
  if(datatype=="bulk"&&bulk_col>=1) {
    sample_lab[!names(sample_lab)%in%c('CytoTRACE','SLICE','SCENT','StemID','StemSC')]<-"yes"
  }
  #!c('aaa','aaa','cc')%in%c('dd','cc','a','b')
  
  add_col<-setdiff(c(bulk_colnames,single_colnames),colnames(file_Sample))
  if(length(add_col)>0){
    add_data<-matrix('-',ncol = length(add_col),nrow = nrow(file_Sample))%>%as.data.frame()
    colnames(add_data)<-add_col
    file_Sample<-cbind(file_Sample,add_data)
  }
  
  
  ###2. 判断癌症类型的细胞或样本的个数
  cancer_sample<-file_Sample[which(file_Sample[,2]=="cancer"),]
  colnames(cancer_sample)[1]<-"samplename"
  
  ###11. 拟时序分析#################################################################################
  tryCatch({
    if(filetype=="count"&&stopMessage_aaa!="Unable to convert data"){#TPM_data 也能跑出结果
      file_EXP_monocle<-file_EXP[,cancer_sample[,1]]
      count_object <- CreateSeuratObject(counts = as.matrix(file_EXP_monocle), project = fileNameEXP, min.cells = 3)
      data <- as(as.matrix(count_object@assays$RNA@counts), 'sparseMatrix')
      pd <- new('AnnotatedDataFrame', data = count_object@meta.data)
      fData <- data.frame(gene_short_name = row.names(data), row.names = row.names(data))
      fd <- new('AnnotatedDataFrame', data = fData)
      HSMM <- newCellDataSet(data,
                             phenoData = pd,
                             featureData = fd,
                             lowerDetectionLimit = 0.5,
                             expressionFamily = negbinomial.size())
      #trace("newCellDataSet",edit = T)

      HSMM <- estimateSizeFactors(HSMM)
      HSMM <- estimateDispersions(HSMM)
      HSMM <- detectGenes(HSMM, min_expr = 0.1)

      disp_table <- dispersionTable(HSMM)
      unsup_clustering_genes <- subset(disp_table, mean_expression >= 0.1)
      HSMM_myo <- setOrderingFilter(HSMM, unsup_clustering_genes$gene_id)

      expressed_genes <- row.names(subset(fData(HSMM),num_cells_expressed >= 10))#过滤掉在小于10个细胞中表达的基因。
      HSMM_ordering_genes <-expressed_genes
      HSMM_myo <-setOrderingFilter(HSMM_myo,ordering_genes = HSMM_ordering_genes)
      HSMM_myo <-reduceDimension(HSMM_myo, max_components = 2,method = 'DDRTree')###这一步非常慢

      HSMM_myo <-orderCells(HSMM_myo)
      RNA_v<-"success"
      #write.table("aa",paste0(file_out,'/','monole.txt'))
      # test=orderCells(HSMM_myo,root_state = 1)
      # plot_cell_trajectory(test, color_by = "Pseudotime",cell_size = 2,show_branch_points = T)

    }else{
      monocle_attention<-"The data type is not count, and monocle cannot be computed"
      write.table(monocle_attention,paste0(file_out,"/monocle_attention.txt"),
                  quote = F,sep = "\t",row.names = F,col.names = F)
    }

  },error = function(e){
    stopMessage_bbb<-"Unable to calculate monocle"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage_bbb,'"}')
    write.table(stopMessage_bbb,paste0(file_out,"/stopMessage_convert.txt"),
                quote = F,sep = "\t",row.names = F,col.names = F)
    return(result_message)
  })
  
  ####开始计算干性得分
  all_start<-c()
  all_end<-c()
  RRA_data<-data.frame(samplename=cancer_sample$samplename)
  if(nrow(cancer_sample)>2&&stopMessage_aaa!="Unable to convert data"){
    
    ###3. 计算CytoTRACE########################################################################
    if("CytoTRACE"%in%all_methods){
      source(paste0(dir_scoreCS,"/CytoTRACECS_multi.R"))
      
      CytoTRACE_dir<-paste0(file_out,"/CytoTRACE")
      if(!dir.exists(CytoTRACE_dir)) dir.create(CytoTRACE_dir)
      
      CytoTRACE_success<-"no"
      start_CytoTRACE <- Sys.time()     ## 记录
      CytoTRACE_re<-CytoTRACECS(ExpfileName=fileNameEXP,SamplefileName=fileNameSample,RNA_v=RNA_v,
                                Expfile=TPM_data,Samplefile=file_Sample,method="CytoTRACE",ID_new=UserTaskID,
                                email_address=email_address,type=datatype,dir_out=CytoTRACE_dir)
      end_CytoTRACE <- Sys.time()       ## 记录
      
      if(class(CytoTRACE_re)=="data.frame"){
        CytoTRACE_success<-"yes" 
        all_start<-c(all_start,start_CytoTRACE)
        all_end<-c(all_end,end_CytoTRACE)
        names(all_start)[length(all_start)]<-"CytoTRACE"
        names(all_end)[length(all_end)]<-"CytoTRACE"
        
        RRA_data<-merge(RRA_data,CytoTRACE_re,by="samplename",all=T)
        colnames(RRA_data)[ncol(RRA_data)]<-"CytoTRACE"
      
      }
    }
    
    ###4. 计算SLICE########################################################################
    if("SLICE"%in%all_methods){
      source(paste0(dir_scoreCS,"/SLICECS_multi.R"))
      
      SLICE_dir<-paste0(file_out,"/SLICE")
      if(!dir.exists(SLICE_dir)) dir.create(SLICE_dir)
      
      SLICE_success<-"no"
      start_SLICE <- Sys.time()     ## 记录
      SLICE_re<-SLICECS(ExpfileName=fileNameEXP,SamplefileName=fileNameSample,RNA_v=RNA_v,hs_km=hs_km,
                        Expfile=TPM_data,Samplefile=file_Sample,method="SLICE",ID_new=UserTaskID,
                        email_address=email_address,type=datatype,dir_out=SLICE_dir)
      end_SLICE <- Sys.time()       ## 记录
      
      if(class(SLICE_re)=="data.frame"){
        SLICE_success<-"yes"
        all_start<-c(all_start,start_SLICE)
        all_end<-c(all_end,end_SLICE)
        names(all_start)[length(all_start)]<-"SLICE"
        names(all_end)[length(all_end)]<-"SLICE"
        
        RRA_data<-merge(RRA_data,SLICE_re,by="samplename",all=T)
        colnames(RRA_data)[ncol(RRA_data)]<-"SLICE"
      }

    }
    
    
    ###5. 计算SCENT########################################################################
    if("SCENT"%in%all_methods){
      source(paste0(dir_scoreCS,"/SCENTCS_multi.R"))
      
      SCENT_dir<-paste0(file_out,"/SCENT")
      if(!dir.exists(SCENT_dir)) dir.create(SCENT_dir)
      
      SCENT_success<-"no"
      start_SCENT <- Sys.time()     ## 记录
      SCENT_re<-SCENTCS(ExpfileName=fileNameEXP,SamplefileName=fileNameSample,RNA_v=RNA_v,PPI_net17Jan16=PPI_net17Jan16,
                        Expfile=TPM_data,Samplefile=file_Sample,method="SCENT",ID_new=UserTaskID,
                        email_address=email_address,type=datatype,dir_out=SCENT_dir)
      end_SCENT <- Sys.time()       ## 记录
      
      if(class(SCENT_re)=="data.frame"){
        SCENT_success<-"yes"
        all_start<-c(all_start,start_SCENT)
        all_end<-c(all_end,end_SCENT)
        names(all_start)[length(all_start)]<-"SCENT"
        names(all_end)[length(all_end)]<-"SCENT"
        
        RRA_data<-merge(RRA_data,SCENT_re,by="samplename",all=T)
        colnames(RRA_data)[ncol(RRA_data)]<-"SCENT"
      }

    }
    
    
    ###6. 计算mRNAsi########################################################################
    if("mRNAsi"%in%all_methods){
      source(paste0(dir_scoreCS,"/mRNAsiCS_multi.R"))
      
      mRNAsi_dir<-paste0(file_out,"/mRNAsi")
      if(!dir.exists(mRNAsi_dir)) dir.create(mRNAsi_dir)
      
      start_mRNAsi <- Sys.time()     ## 记录
      mRNAsi_re<-mRNAsiCS(ExpfileName=fileNameEXP,SamplefileName=fileNameSample,mRNAsi_model=mRNAsi_model,
                          Expfile=TPM_data,Samplefile=file_Sample,method="mRNAsi",ID_new=UserTaskID,
                          email_address=email_address,type=datatype,dir_out=mRNAsi_dir)
      end_mRNAsi <- Sys.time()       ## 记录
      
      if(class(mRNAsi_re)=="data.frame"){
        all_start<-c(all_start,start_mRNAsi)
        all_end<-c(all_end,end_mRNAsi)
        names(all_start)[length(all_start)]<-"mRNAsi"
        names(all_end)[length(all_end)]<-"mRNAsi"
        
        RRA_data<-merge(RRA_data,mRNAsi_re,by="samplename",all=T)
        colnames(RRA_data)[ncol(RRA_data)]<-"mRNAsi"
      }

    }
    
    
    ###7. 计算StemnessIndex########################################################################
    if("StemnessIndex"%in%all_methods){
      source(paste0(dir_scoreCS,"/StemnessIndexCS_multi.R"))
      
      StemnessIndex_dir<-paste0(file_out,"/StemnessIndex")
      if(!dir.exists(StemnessIndex_dir)) dir.create(StemnessIndex_dir)
      
      start_StemnessIndex <- Sys.time()     ## 记录
      StemnessIndex_re<-StemnessIndexCS(ExpfileName=fileNameEXP,SamplefileName=fileNameSample,gene_pairs_SYMBOL_StemnessIndex=gene_pairs_SYMBOL_StemnessIndex,
                                        Expfile=TPM_data,Samplefile=file_Sample,method="StemnessIndex",ID_new=UserTaskID,
                                        email_address=email_address,type=datatype,dir_out=StemnessIndex_dir)
      end_StemnessIndex <- Sys.time()       ## 记录
      
      if(class(StemnessIndex_re)=="data.frame"){
        all_start<-c(all_start,start_StemnessIndex)
        all_end<-c(all_end,end_StemnessIndex)
        names(all_start)[length(all_start)]<-"StemnessIndex"
        names(all_end)[length(all_end)]<-"StemnessIndex"
        
        RRA_data<-merge(RRA_data,StemnessIndex_re,by="samplename",all=T)
        colnames(RRA_data)[ncol(RRA_data)]<-"StemnessIndex"
      }

    }
    
    
    ###8. 计算StemSC########################################################################
    if("StemSC"%in%all_methods){
      source(paste0(dir_scoreCS,"/StemSCCS_multi.R"))
      
      StemSC_dir<-paste0(file_out,"/StemSC")
      if(!dir.exists(StemSC_dir)) dir.create(StemSC_dir)
      
      StemSC_success<-"no"
      start_StemSC <- Sys.time()     ## 记录
      StemSC_re<-StemSCCS(ExpfileName=fileNameEXP,SamplefileName=fileNameSample,RNA_v=RNA_v,gene_pairs_SYMBOL_StemSC=gene_pairs_SYMBOL_StemSC,
                          Expfile=TPM_data,Samplefile=file_Sample,method="StemSC",ID_new=UserTaskID,
                          email_address=email_address,type=datatype,dir_out=StemSC_dir)
      end_StemSC <- Sys.time()       ## 记录
      
      if(class(StemSC_re)=="data.frame"){
        StemSC_success<-"yes"
        all_start<-c(all_start,start_StemSC)
        all_end<-c(all_end,end_StemSC)
        names(all_start)[length(all_start)]<-"StemSC"
        names(all_end)[length(all_end)]<-"StemSC"
        
        RRA_data<-merge(RRA_data,StemSC_re,by="samplename",all=T)
        colnames(RRA_data)[ncol(RRA_data)]<-"StemSC"
      }

    }
    
    
    ###9. 计算GSVA########################################################################
    if("GSVA"%in%all_methods&&length(all_geneset)>0){
      
      
      GSVA_dir<-paste0(file_out,"/GSVA")
      if(!dir.exists(GSVA_dir)) dir.create(GSVA_dir)
      
      if(filetype=="count"){
        RNA_v<-RNA_v
      }else{
        RNA_v<-"no"
      }
      
      if(datatype=="single"){
        source(paste0(dir_scoreCS,"/GSVACS_multi_single.R"))
      }else{
        source(paste0(dir_scoreCS,"/GSVACS_multi_bulk.R"))
      }
      
      start_GSVA<-c()
      end_GSVA<-c()
      GSVA_success<-c()
      GSVA_re<-data.frame(samplename=cancer_sample[,1])
      for(j in 1:length(all_geneset)){
        #j=1
        GSVA_geneset_dir<-paste0(GSVA_dir,"/",all_geneset[j])
        if(!dir.exists(GSVA_geneset_dir)){
          dir.create(GSVA_geneset_dir)
        }
        
        start_geneset <- Sys.time()     ## 记录
        GSVA_result<-GSVACS(ExpfileName=fileNameEXP,SamplefileName=fileNameSample,RNA_v=RNA_v,genesetList=genesetList,
                            Expfile=TPM_data,Samplefile=file_Sample,method="GSVA",ID_new=UserTaskID,
                            geneset=all_geneset[j],type=datatype,
                            email_address=email_address,dir_out=GSVA_geneset_dir)
        end_geneset <- Sys.time()       ## 记录
        
        if(class(GSVA_result)=="data.frame"){
          GSVA_success<-c(GSVA_success,"yes")
          start_GSVA<-c(start_GSVA,start_geneset)
          end_GSVA<-c(end_GSVA,end_geneset)
          names(start_GSVA)<-paste0("GSVA_",all_geneset[1:j])
          names(end_GSVA)<-paste0("GSVA_",all_geneset[1:j])
          
          GSVA_re<-cbind(GSVA_re,GSVA_result[match(GSVA_re$samplename,GSVA_result[,1]),2])%>%as.data.frame()
          GSVA_re[,(j+1)]<-as.numeric(GSVA_re[,(j+1)])
          colnames(GSVA_re)<-c("samplename",paste0("GSVA_",all_geneset[1:j]))
        }

      }
      
      if(ncol(GSVA_re)>1){
        all_start<-c(all_start,start_GSVA)
        all_end<-c(all_end,end_GSVA)
        
        RRA_data<-merge(RRA_data,GSVA_re,by="samplename",all=T)
      }

    }
    
    
    ###10. 计算StemID########################################################################
    ###StemID有删失细胞的情况###################################################################
	StemID_dir<-paste0(file_out,"/StemID")
      if(!dir.exists(StemID_dir)){
        dir.create(StemID_dir)
      }
	  
    if("StemID"%in%all_methods&&filetype=="count"){
      source(paste0(dir_scoreCS,"/StemIDCS_multi.R"))
      
      
      StemID_success<-"no"
      start_StemID <- Sys.time()     ## 记录
      StemID_re<-StemIDCS(ExpfileName=fileNameEXP,SamplefileName=fileNameSample,RNA_v=RNA_v,
                          Expfile=file_EXP,Samplefile=file_Sample,method="StemID",ID_new=UserTaskID,
                          email_address=email_address,type=datatype,dir_out=StemID_dir)
      end_StemID <- Sys.time()       ## 记录
      
      if(class(StemID_re)=="data.frame"){
        StemID_success<-"yes"
        all_start<-c(all_start,start_StemID)
        all_end<-c(all_end,end_StemID)
        names(all_start)[length(all_start)]<-"StemID"
        names(all_end)[length(all_end)]<-"StemID"
        
        RRA_data<-merge(RRA_data,StemID_re,by="samplename",all=T)
        colnames(RRA_data)[ncol(RRA_data)]<-"StemID"
      }

    }
    
    
    ###RRA秩融合所有得分#####################################################################
      rownames(RRA_data)<-RRA_data$samplename
      RRA_data<-RRA_data[,-1]%>%as.matrix()
      RRA_data[is.na(RRA_data)]<-0
      RRA_data<-as.data.frame(RRA_data)
      RRA_data$samplename<-rownames(RRA_data)
      RRA_data<-RRA_data[,c(ncol(RRA_data),1:(ncol(RRA_data)-1))]
      
      score_list<-list()
      for(RRA_i in 2:ncol(RRA_data)){#RRA_i=1
        RRA_data<-RRA_data[order(RRA_data[,RRA_i],decreasing = T),]
        score_list[[(RRA_i-1)]]<-rownames(RRA_data)
      }
      names(score_list)<-colnames(RRA_data)[2:ncol(RRA_data)]
      #应用RRA算法，对基因进行整合排序
      RRA_score=aggregateRanks(score_list)
      
      RRA_score<-RRA_score[rownames(RRA_data),]
      RRA_data$RRA_p<-RRA_score$Score
      RRA_data$RRA_rank<-1-RRA_score$Score
      write.table(RRA_data,paste0(file_out,"/score_RRA.txt"),quote = F,sep = '\t')
      
      #RRA_data<-read.delim("E:/Mirror/cell_stemness/xiugai/data/single_re/score_RRA.txt",stringsAsFactors = F,check.names = F)
      ###json格式
      # RRA_data_single<-read.delim("E:/Mirror/cell_stemness/xiugai/data/single_re/score_RRA.txt",
      #                             stringsAsFactors = F,check.names = F)
      RRA_json<-toJSON(RRA_data, pretty=TRUE)
      cat(str_c('{\"data\": ',RRA_json,'}'), 
          file = paste0(file_out,"/score_RRA_dataTable.txt"), 
          fill = FALSE, labels = NULL, append = FALSE)
      
      #####秩融合得分与各种干性得分的spearman相关性
      RRA_stem_p<-lapply(setdiff(colnames(RRA_data),c('samplename','RRA_p','RRA_rank')),function(x){#x="CytoTRACE"
        stem_score<-RRA_data[,x]
        cor_re<-cor.test(stem_score,RRA_data$RRA_rank,method = "spearman")
        return(cor_re$p.value)
        
      })%>%unlist()
      names(RRA_stem_p)<-setdiff(colnames(RRA_data),c('samplename','RRA_p','RRA_rank'))
      RRA_stem_p[is.na(RRA_stem_p)]<-1
      
      RRA_stem_cor<-lapply(setdiff(colnames(RRA_data),c('samplename','RRA_p','RRA_rank')),function(x){#x="CytoTRACE"
        stem_score<-RRA_data[,x]
        cor_re<-cor.test(stem_score,RRA_data$RRA_rank,method = "spearman")
        return(cor_re$estimate)
        
      })%>%unlist()
      names(RRA_stem_cor)<-setdiff(colnames(RRA_data),c('samplename','RRA_p','RRA_rank'))
      RRA_stem_cor[is.na(RRA_stem_cor)]<-0
    
    ####运行时间计算#######################################################################
    all_time<-(all_end-all_start)/60
    all_time<-all_time[order(all_time)]
    RRA_stem_cor<-RRA_stem_cor[names(all_time)]
    RRA_stem_p<-RRA_stem_p[names(all_time)]
    sample_lab<-sample_lab[names(all_time)]
    time_json<-paste0('{','\n',
                      '"data_type":','"',filetype,'"',',','\n',
                      '"methodName":','"',paste0(names(all_time),collapse = ","),'"',',','\n',
                      '"methodTime":','"',paste0(all_time,collapse = ","),'"',',',"\n",
                      '"spearman_corr":','"',paste0(RRA_stem_cor,collapse = ","),'"',',','\n',
                      '"spearman_corr_p":','"',paste0(RRA_stem_p,collapse = ","),'"',','
    )
    write.table(time_json,paste0(file_out,"/time.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    
    for(lab_i in 1:length(all_time)){
      mid_sample<-paste0('"',paste0(names(all_time)[lab_i],'_sample'),'":','"',sample_lab[lab_i],'"',',')
      write.table(mid_sample,paste0(file_out,"/time.txt"),quote = F,sep = "\t",row.names = F,col.names = F,append = T)
    }
    
    out_end<-paste0('"stopMessage" :','"no"',"\n",
                    '}')
    write.table(out_end,paste0(file_out,"/time.txt"),quote = F,sep = "\t",row.names = F,col.names = F,append = T)
  
    
  ###############################################################################################
  ###干性得分计算结束     
  ####################################################################################################
    
    ####monocle###############
    #####CytoTRACE monocle#######################################################################################
    tryCatch({
      if("CytoTRACE"%in%all_methods&&CytoTRACE_success=="yes"&&RNA_v=="success"){
        filter_cell<-setdiff(data@Dimnames[[2]],CytoTRACE_re[,1])
        if(length(filter_cell)>0){
          filter_score<-data.frame(samplename=filter_cell,score=rep(0,length(filter_cell)))
          CytoTRACE_re<-rbind(CytoTRACE_re,filter_score)%>%as.data.frame()
        }
        
        HSMM_myo2<-HSMM_myo
        HSMM_myo2@phenoData@data[["CytoTRACE"]]<-CytoTRACE_re[match(data@Dimnames[[2]],CytoTRACE_re[,1]),2]
        state_score<-data.frame(state=as.numeric(HSMM_myo@phenoData@data[["State"]]),
                                score=CytoTRACE_re[match(data@Dimnames[[2]],CytoTRACE_re[,1]),2])
        state_mean<-aggregate(state_score,by=list(state_score$state),FUN = mean)
        root_state_CytoTRACE<-state_mean$state[which.max(state_mean$score)]
        test=orderCells(HSMM_myo2,root_state = root_state_CytoTRACE) 
        
        ##提取细胞坐标#########################################
        bb_monocle<-data.frame(t(as.matrix(test@reducedDimS)))
        colnames(bb_monocle)<-c("tSNE_1","tSNE_2")
        bb_monocle$Pseudotime<-test@phenoData@data[,"Pseudotime"]
        bb_monocle$CytoTRACE<-test@phenoData@data[,"CytoTRACE"]
        
        ##提取边坐标#################################################
        reduced_dim_coords <- reducedDimK(test)
        ica_space_df <- Matrix::t(reduced_dim_coords) %>%
          as.data.frame() %>%
          dplyr::select(prin_graph_dim_1 = 1, prin_graph_dim_2 = 2) %>%
          mutate(sample_name = rownames(.), sample_state = rownames(.))
        
        dp_mst <- minSpanningTree(test)
        
        edge_df <- dp_mst %>%
          igraph::as_data_frame() %>%
          dplyr::select(source = "from", target = "to") %>%
          left_join(ica_space_df %>% dplyr::select(source="sample_name", source_prin_graph_dim_1="prin_graph_dim_1", source_prin_graph_dim_2="prin_graph_dim_2"), by = "source") %>%
          left_join(ica_space_df %>% dplyr::select(target="sample_name", target_prin_graph_dim_1="prin_graph_dim_1", target_prin_graph_dim_2="prin_graph_dim_2"), by = "target")
        
        return_rotation_mat <- function(theta) {
          theta <- theta / 180 * pi
          matrix(c(cos(theta), sin(theta), -sin(theta), cos(theta)), nrow = 2)
        }
        rot_mat <- return_rotation_mat(0)
        
        cn2 <- c("source_prin_graph_dim_1", "source_prin_graph_dim_2")
        cn3 <- c("target_prin_graph_dim_1", "target_prin_graph_dim_2")
        edge_df[, cn2] <- as.matrix(edge_df[, cn2]) %*% t(rot_mat)
        edge_df[, cn3] <- as.matrix(edge_df[, cn3]) %*% t(rot_mat)
        
        edge_df$source_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("source_prin_graph_dim_1","source_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$target_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("target_prin_graph_dim_1","target_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$source_target<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0(edge_df[x,c("source_paste","target_paste")],collapse = ',')
        })%>%unlist()
        
        mst_branch_nodes <- test@auxOrderingData[[test@dim_reduce_type]]$branch_points
        
        #############转为json格式############################################
        monocle_json<-paste0(paste0('"cell"',':','"',paste0(rownames(bb_monocle),collapse = ","),'"'),',','\n',
                             paste0('"tsne_x"',':','"',paste0(bb_monocle$tSNE_1,collapse = ","),'"'),',','\n',
                             paste0('"tsne_y"',':','"',paste0(bb_monocle$tSNE_2,collapse = ","),'"'),',','\n',
                             paste0('"Pseudotime"',':','"',paste0(bb_monocle$Pseudotime,collapse = ","),'"'),',','\n',
                             paste0('"CSscore"',':','"',paste0(bb_monocle$CytoTRACE,collapse = ","),'"'),',','\n',
                             paste0('"edges_coordinate"',':','"',paste0(edge_df$source_targe,collapse = ";"),'"'),',','\n',
                             paste0('"cscore_max"',':','"',max(bb_monocle$CytoTRACE),'"'),',','\n',
                             paste0('"time_max"',':','"',max(bb_monocle$Pseudotime),'"')
        )
        monocle_json<-paste0('{','\n',
                             monocle_json,'\n',
                             '}')
        write.table(monocle_json,paste0(CytoTRACE_dir,"/","CS_monocle.txt"),
                    quote = F,sep = '\t',row.names = F,col.names = F)
        ###输出
      }
    },error = function(e){
      monocle_stopMessage<-"Monocle of CytoTRACE cannot be calculated"
      #result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
      write.table(monocle_stopMessage,paste0(CytoTRACE_dir,"/","monocle_stopMessage.txt"),
                   quote = F,sep = '\t',row.names = F,col.names = F)
      return(monocle_stopMessage)
    })
    

    ######SLICE monocle##############################################################################
    tryCatch({
      if("SLICE"%in%all_methods&&SLICE_success=="yes"&&RNA_v=="success"){
        filter_cell<-setdiff(data@Dimnames[[2]],SLICE_re[,1])
        if(length(filter_cell)>0){
          filter_score<-data.frame(samplename=filter_cell,score=rep(0,length(filter_cell)))
          SLICE_re<-rbind(SLICE_re,filter_score)%>%as.data.frame()
        }
        
        HSMM_myo2<-HSMM_myo
        HSMM_myo2@phenoData@data[["SLICE"]]<-SLICE_re[match(data@Dimnames[[2]],SLICE_re[,1]),2]
        state_score<-data.frame(state=as.numeric(HSMM_myo@phenoData@data[["State"]]),
                                score=SLICE_re[match(data@Dimnames[[2]],SLICE_re[,1]),2])
        state_mean<-aggregate(state_score,by=list(state_score$state),FUN = mean)
        root_state_SLICE<-state_mean$state[which.max(state_mean$score)]
        test=orderCells(HSMM_myo2,root_state = root_state_SLICE) 
        
        ##提取细胞坐标#########################################
        bb_monocle<-data.frame(t(as.matrix(test@reducedDimS)))
        colnames(bb_monocle)<-c("tSNE_1","tSNE_2")
        bb_monocle$Pseudotime<-test@phenoData@data[,"Pseudotime"]
        bb_monocle$SLICE<-test@phenoData@data[,"SLICE"]
        
        ##提取边坐标#################################################
        reduced_dim_coords <- reducedDimK(test)
        ica_space_df <- Matrix::t(reduced_dim_coords) %>%
          as.data.frame() %>%
          dplyr::select(prin_graph_dim_1 = 1, prin_graph_dim_2 = 2) %>%
          mutate(sample_name = rownames(.), sample_state = rownames(.))
        
        dp_mst <- minSpanningTree(test)
        
        edge_df <- dp_mst %>%
          igraph::as_data_frame() %>%
          dplyr::select(source = "from", target = "to") %>%
          left_join(ica_space_df %>% dplyr::select(source="sample_name", source_prin_graph_dim_1="prin_graph_dim_1", source_prin_graph_dim_2="prin_graph_dim_2"), by = "source") %>%
          left_join(ica_space_df %>% dplyr::select(target="sample_name", target_prin_graph_dim_1="prin_graph_dim_1", target_prin_graph_dim_2="prin_graph_dim_2"), by = "target")
        
        return_rotation_mat <- function(theta) {
          theta <- theta / 180 * pi
          matrix(c(cos(theta), sin(theta), -sin(theta), cos(theta)), nrow = 2)
        }
        rot_mat <- return_rotation_mat(0)
        
        cn2 <- c("source_prin_graph_dim_1", "source_prin_graph_dim_2")
        cn3 <- c("target_prin_graph_dim_1", "target_prin_graph_dim_2")
        edge_df[, cn2] <- as.matrix(edge_df[, cn2]) %*% t(rot_mat)
        edge_df[, cn3] <- as.matrix(edge_df[, cn3]) %*% t(rot_mat)
        
        edge_df$source_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("source_prin_graph_dim_1","source_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$target_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("target_prin_graph_dim_1","target_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$source_target<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0(edge_df[x,c("source_paste","target_paste")],collapse = ',')
        })%>%unlist()
        
        mst_branch_nodes <- test@auxOrderingData[[test@dim_reduce_type]]$branch_points
        
        #############转为json格式############################################
        monocle_json<-paste0(paste0('"cell"',':','"',paste0(rownames(bb_monocle),collapse = ","),'"'),',','\n',
                             paste0('"tsne_x"',':','"',paste0(bb_monocle$tSNE_1,collapse = ","),'"'),',','\n',
                             paste0('"tsne_y"',':','"',paste0(bb_monocle$tSNE_2,collapse = ","),'"'),',','\n',
                             paste0('"Pseudotime"',':','"',paste0(bb_monocle$Pseudotime,collapse = ","),'"'),',','\n',
                             paste0('"CSscore"',':','"',paste0(bb_monocle$SLICE,collapse = ","),'"'),',','\n',
                             paste0('"edges_coordinate"',':','"',paste0(edge_df$source_targe,collapse = ";"),'"'),',','\n',
                             paste0('"cscore_max"',':','"',max(bb_monocle$SLICE),'"'),',','\n',
                             paste0('"time_max"',':','"',max(bb_monocle$Pseudotime),'"')
        )
        monocle_json<-paste0('{','\n',
                             monocle_json,'\n',
                             '}')
        write.table(monocle_json,paste0(SLICE_dir,"/","CS_monocle.txt"),
                    quote = F,sep = '\t',row.names = F,col.names = F)
        ###输出
      }
    },error = function(e){
      monocle_stopMessage<-"Monocle of SLICE cannot be calculated"
      #result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
      write.table(monocle_stopMessage,paste0(SLICE_dir,"/","monocle_stopMessage.txt"),
                   quote = F,sep = '\t',row.names = F,col.names = F)
      return(monocle_stopMessage)
    })
    

    ######SCENT monocle##############################################################################
    tryCatch({
      if("SCENT"%in%all_methods&&SCENT_success=="yes"&&RNA_v=="success"){
        filter_cell<-setdiff(data@Dimnames[[2]],SCENT_re[,1])
        if(length(filter_cell)>0){
          filter_score<-data.frame(samplename=filter_cell,score=rep(0,length(filter_cell)))
          SCENT_re<-rbind(SCENT_re,filter_score)%>%as.data.frame()
        }
        
        HSMM_myo2<-HSMM_myo
        HSMM_myo2@phenoData@data[["SCENT"]]<-SCENT_re[match(data@Dimnames[[2]],SCENT_re[,1]),2]
        state_score<-data.frame(state=as.numeric(HSMM_myo@phenoData@data[["State"]]),
                                score=SCENT_re[match(data@Dimnames[[2]],SCENT_re[,1]),2])
        state_mean<-aggregate(state_score,by=list(state_score$state),FUN = mean)
        root_state_SCENT<-state_mean$state[which.max(state_mean$score)]
        test=orderCells(HSMM_myo2,root_state = root_state_SCENT) 
        
        ##提取细胞坐标#########################################
        bb_monocle<-data.frame(t(as.matrix(test@reducedDimS)))
        colnames(bb_monocle)<-c("tSNE_1","tSNE_2")
        bb_monocle$Pseudotime<-test@phenoData@data[,"Pseudotime"]
        bb_monocle$SCENT<-test@phenoData@data[,"SCENT"]
        
        ##提取边坐标#################################################
        reduced_dim_coords <- reducedDimK(test)
        ica_space_df <- Matrix::t(reduced_dim_coords) %>%
          as.data.frame() %>%
          dplyr::select(prin_graph_dim_1 = 1, prin_graph_dim_2 = 2) %>%
          mutate(sample_name = rownames(.), sample_state = rownames(.))
        
        dp_mst <- minSpanningTree(test)
        
        edge_df <- dp_mst %>%
          igraph::as_data_frame() %>%
          dplyr::select(source = "from", target = "to") %>%
          left_join(ica_space_df %>% dplyr::select(source="sample_name", source_prin_graph_dim_1="prin_graph_dim_1", source_prin_graph_dim_2="prin_graph_dim_2"), by = "source") %>%
          left_join(ica_space_df %>% dplyr::select(target="sample_name", target_prin_graph_dim_1="prin_graph_dim_1", target_prin_graph_dim_2="prin_graph_dim_2"), by = "target")
        
        return_rotation_mat <- function(theta) {
          theta <- theta / 180 * pi
          matrix(c(cos(theta), sin(theta), -sin(theta), cos(theta)), nrow = 2)
        }
        rot_mat <- return_rotation_mat(0)
        
        cn2 <- c("source_prin_graph_dim_1", "source_prin_graph_dim_2")
        cn3 <- c("target_prin_graph_dim_1", "target_prin_graph_dim_2")
        edge_df[, cn2] <- as.matrix(edge_df[, cn2]) %*% t(rot_mat)
        edge_df[, cn3] <- as.matrix(edge_df[, cn3]) %*% t(rot_mat)
        
        edge_df$source_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("source_prin_graph_dim_1","source_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$target_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("target_prin_graph_dim_1","target_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$source_target<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0(edge_df[x,c("source_paste","target_paste")],collapse = ',')
        })%>%unlist()
        
        mst_branch_nodes <- test@auxOrderingData[[test@dim_reduce_type]]$branch_points
        
        #############转为json格式############################################
        monocle_json<-paste0(paste0('"cell"',':','"',paste0(rownames(bb_monocle),collapse = ","),'"'),',','\n',
                             paste0('"tsne_x"',':','"',paste0(bb_monocle$tSNE_1,collapse = ","),'"'),',','\n',
                             paste0('"tsne_y"',':','"',paste0(bb_monocle$tSNE_2,collapse = ","),'"'),',','\n',
                             paste0('"Pseudotime"',':','"',paste0(bb_monocle$Pseudotime,collapse = ","),'"'),',','\n',
                             paste0('"CSscore"',':','"',paste0(bb_monocle$SCENT,collapse = ","),'"'),',','\n',
                             paste0('"edges_coordinate"',':','"',paste0(edge_df$source_targe,collapse = ";"),'"'),',','\n',
                             paste0('"cscore_max"',':','"',max(bb_monocle$SCENT),'"'),',','\n',
                             paste0('"time_max"',':','"',max(bb_monocle$Pseudotime),'"')
        )
        monocle_json<-paste0('{','\n',
                             monocle_json,'\n',
                             '}')
        write.table(monocle_json,paste0(SCENT_dir,"/","CS_monocle.txt"),
                    quote = F,sep = '\t',row.names = F,col.names = F)
        ###输出
      }
    },error = function(e){
      monocle_stopMessage<-"Monocle of SCENT cannot be calculated"
      #result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
      write.table(monocle_stopMessage,paste0(SCENT_dir,"/","monocle_stopMessage.txt"),
                   quote = F,sep = '\t',row.names = F,col.names = F)
      return(monocle_stopMessage)
    })
    
    
    ######StemSC monocle##############################################################################
    tryCatch({
      if("StemSC"%in%all_methods&&StemSC_success=="yes"&&RNA_v=="success"){
        filter_cell<-setdiff(data@Dimnames[[2]],StemSC_re[,1])
        if(length(filter_cell)>0){
          filter_score<-data.frame(samplename=filter_cell,score=rep(0,length(filter_cell)))
          StemSC_re<-rbind(StemSC_re,filter_score)%>%as.data.frame()
        }
        
        HSMM_myo2<-HSMM_myo
        HSMM_myo2@phenoData@data[["StemSC"]]<-StemSC_re[match(data@Dimnames[[2]],StemSC_re[,1]),2]
        state_score<-data.frame(state=as.numeric(HSMM_myo@phenoData@data[["State"]]),
                                score=StemSC_re[match(data@Dimnames[[2]],StemSC_re[,1]),2])
        state_mean<-aggregate(state_score,by=list(state_score$state),FUN = mean)
        root_state_StemSC<-state_mean$state[which.max(state_mean$score)]
        test=orderCells(HSMM_myo2,root_state = root_state_StemSC) 
        
        ##提取细胞坐标#########################################
        bb_monocle<-data.frame(t(as.matrix(test@reducedDimS)))
        colnames(bb_monocle)<-c("tSNE_1","tSNE_2")
        bb_monocle$Pseudotime<-test@phenoData@data[,"Pseudotime"]
        bb_monocle$StemSC<-test@phenoData@data[,"StemSC"]
        
        ##提取边坐标#################################################
        reduced_dim_coords <- reducedDimK(test)
        ica_space_df <- Matrix::t(reduced_dim_coords) %>%
          as.data.frame() %>%
          dplyr::select(prin_graph_dim_1 = 1, prin_graph_dim_2 = 2) %>%
          mutate(sample_name = rownames(.), sample_state = rownames(.))
        
        dp_mst <- minSpanningTree(test)
        
        edge_df <- dp_mst %>%
          igraph::as_data_frame() %>%
          dplyr::select(source = "from", target = "to") %>%
          left_join(ica_space_df %>% dplyr::select(source="sample_name", source_prin_graph_dim_1="prin_graph_dim_1", source_prin_graph_dim_2="prin_graph_dim_2"), by = "source") %>%
          left_join(ica_space_df %>% dplyr::select(target="sample_name", target_prin_graph_dim_1="prin_graph_dim_1", target_prin_graph_dim_2="prin_graph_dim_2"), by = "target")
        
        return_rotation_mat <- function(theta) {
          theta <- theta / 180 * pi
          matrix(c(cos(theta), sin(theta), -sin(theta), cos(theta)), nrow = 2)
        }
        rot_mat <- return_rotation_mat(0)
        
        cn2 <- c("source_prin_graph_dim_1", "source_prin_graph_dim_2")
        cn3 <- c("target_prin_graph_dim_1", "target_prin_graph_dim_2")
        edge_df[, cn2] <- as.matrix(edge_df[, cn2]) %*% t(rot_mat)
        edge_df[, cn3] <- as.matrix(edge_df[, cn3]) %*% t(rot_mat)
        
        edge_df$source_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("source_prin_graph_dim_1","source_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$target_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("target_prin_graph_dim_1","target_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$source_target<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0(edge_df[x,c("source_paste","target_paste")],collapse = ',')
        })%>%unlist()
        
        mst_branch_nodes <- test@auxOrderingData[[test@dim_reduce_type]]$branch_points
        
        #############转为json格式############################################
        monocle_json<-paste0(paste0('"cell"',':','"',paste0(rownames(bb_monocle),collapse = ","),'"'),',','\n',
                             paste0('"tsne_x"',':','"',paste0(bb_monocle$tSNE_1,collapse = ","),'"'),',','\n',
                             paste0('"tsne_y"',':','"',paste0(bb_monocle$tSNE_2,collapse = ","),'"'),',','\n',
                             paste0('"Pseudotime"',':','"',paste0(bb_monocle$Pseudotime,collapse = ","),'"'),',','\n',
                             paste0('"CSscore"',':','"',paste0(bb_monocle$StemSC,collapse = ","),'"'),',','\n',
                             paste0('"edges_coordinate"',':','"',paste0(edge_df$source_targe,collapse = ";"),'"'),',','\n',
                             paste0('"cscore_max"',':','"',max(bb_monocle$StemSC),'"'),',','\n',
                             paste0('"time_max"',':','"',max(bb_monocle$Pseudotime),'"')
        )
        monocle_json<-paste0('{','\n',
                             monocle_json,'\n',
                             '}')
        write.table(monocle_json,paste0(StemSC_dir,"/","CS_monocle.txt"),
                    quote = F,sep = '\t',row.names = F,col.names = F)
        ###输出
      }
    },error = function(e){
      monocle_stopMessage<-"Monocle of StemSC cannot be calculated"
      #result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
      write.table(monocle_stopMessage,paste0(StemSC_dir,"/","monocle_stopMessage.txt"),
                   quote = F,sep = '\t',row.names = F,col.names = F)
      return(monocle_stopMessage)
    })
    
    
    ######StemID monocle##############################################################################
    tryCatch({
      if("StemID"%in%all_methods&&StemID_success=="yes"&&RNA_v=="success"){
        filter_cell<-setdiff(data@Dimnames[[2]],StemID_re[,1])
        if(length(filter_cell)>0){
          filter_score<-data.frame(samplename=filter_cell,score=rep(0,length(filter_cell)))
          StemID_re<-rbind(StemID_re,filter_score)%>%as.data.frame()
        }
        
        HSMM_myo2<-HSMM_myo
        HSMM_myo2@phenoData@data[["StemID"]]<-StemID_re[match(data@Dimnames[[2]],StemID_re[,1]),2]
        state_score<-data.frame(state=as.numeric(HSMM_myo@phenoData@data[["State"]]),
                                score=StemID_re[match(data@Dimnames[[2]],StemID_re[,1]),2])
        state_mean<-aggregate(state_score,by=list(state_score$state),FUN = mean)
        root_state_StemID<-state_mean$state[which.max(state_mean$score)]
        test=orderCells(HSMM_myo2,root_state = root_state_StemID) 
        
        ##提取细胞坐标#########################################
        bb_monocle<-data.frame(t(as.matrix(test@reducedDimS)))
        colnames(bb_monocle)<-c("tSNE_1","tSNE_2")
        bb_monocle$Pseudotime<-test@phenoData@data[,"Pseudotime"]
        bb_monocle$StemID<-test@phenoData@data[,"StemID"]
        
        ##提取边坐标#################################################
        reduced_dim_coords <- reducedDimK(test)
        ica_space_df <- Matrix::t(reduced_dim_coords) %>%
          as.data.frame() %>%
          dplyr::select(prin_graph_dim_1 = 1, prin_graph_dim_2 = 2) %>%
          mutate(sample_name = rownames(.), sample_state = rownames(.))
        
        dp_mst <- minSpanningTree(test)
        
        edge_df <- dp_mst %>%
          igraph::as_data_frame() %>%
          dplyr::select(source = "from", target = "to") %>%
          left_join(ica_space_df %>% dplyr::select(source="sample_name", source_prin_graph_dim_1="prin_graph_dim_1", source_prin_graph_dim_2="prin_graph_dim_2"), by = "source") %>%
          left_join(ica_space_df %>% dplyr::select(target="sample_name", target_prin_graph_dim_1="prin_graph_dim_1", target_prin_graph_dim_2="prin_graph_dim_2"), by = "target")
        
        return_rotation_mat <- function(theta) {
          theta <- theta / 180 * pi
          matrix(c(cos(theta), sin(theta), -sin(theta), cos(theta)), nrow = 2)
        }
        rot_mat <- return_rotation_mat(0)
        
        cn2 <- c("source_prin_graph_dim_1", "source_prin_graph_dim_2")
        cn3 <- c("target_prin_graph_dim_1", "target_prin_graph_dim_2")
        edge_df[, cn2] <- as.matrix(edge_df[, cn2]) %*% t(rot_mat)
        edge_df[, cn3] <- as.matrix(edge_df[, cn3]) %*% t(rot_mat)
        
        edge_df$source_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("source_prin_graph_dim_1","source_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$target_paste<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0('[',paste0(edge_df[x,c("target_prin_graph_dim_1","target_prin_graph_dim_2")],collapse = ','),']')
        })%>%unlist()
        edge_df$source_target<-lapply(1:nrow(edge_df),function(x){#x=1
          paste0(edge_df[x,c("source_paste","target_paste")],collapse = ',')
        })%>%unlist()
        
        mst_branch_nodes <- test@auxOrderingData[[test@dim_reduce_type]]$branch_points
        
        #############转为json格式############################################
        monocle_json<-paste0(paste0('"cell"',':','"',paste0(rownames(bb_monocle),collapse = ","),'"'),',','\n',
                             paste0('"tsne_x"',':','"',paste0(bb_monocle$tSNE_1,collapse = ","),'"'),',','\n',
                             paste0('"tsne_y"',':','"',paste0(bb_monocle$tSNE_2,collapse = ","),'"'),',','\n',
                             paste0('"Pseudotime"',':','"',paste0(bb_monocle$Pseudotime,collapse = ","),'"'),',','\n',
                             paste0('"CSscore"',':','"',paste0(bb_monocle$StemID,collapse = ","),'"'),',','\n',
                             paste0('"edges_coordinate"',':','"',paste0(edge_df$source_targe,collapse = ";"),'"'),',','\n',
                             paste0('"cscore_max"',':','"',max(bb_monocle$StemID),'"'),',','\n',
                             paste0('"time_max"',':','"',max(bb_monocle$Pseudotime),'"')
        )
        monocle_json<-paste0('{','\n',
                             monocle_json,'\n',
                             '}')
        write.table(monocle_json,paste0(StemID_dir,"/","CS_monocle.txt"),
                    quote = F,sep = '\t',row.names = F,col.names = F)
        ###输出
      }
    },error = function(e){
      monocle_stopMessage<-"Monocle of StemID cannot be calculated"
      #result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
      write.table(monocle_stopMessage,paste0(StemID_dir,"/","monocle_stopMessage.txt"),
                   quote = F,sep = '\t',row.names = F,col.names = F)
      return(monocle_stopMessage)
    })
    
    
    
    ######GSVA monocle##############################################################################
    tryCatch({
      if("GSVA"%in%all_methods&&length(which(GSVA_success=="yes"))==(ncol(GSVA_re)-1)&&RNA_v=="success"){
        filter_cell<-setdiff(data@Dimnames[[2]],GSVA_re[,1])
        if(length(filter_cell)>0){
          filter_matrix<-matrix(0,ncol = (ncol(GSVA_re)-1),nrow = length(filter_cell))
          filter_score<-data.frame(samplename=filter_cell)
          filter_score<-cbind(filter_score,filter_matrix)%>%as.data.frame()
          colnames(filter_score)<-colnames(GSVA_re)
          GSVA_re<-rbind(GSVA_re,filter_score)%>%as.data.frame()
        }
        
        for(GSVA_monocle in 1:(ncol(GSVA_re)-1)){#GSVA_monocle=1
          HSMM_myo2<-HSMM_myo
          HSMM_myo2@phenoData@data[["GSVA"]]<-GSVA_re[match(data@Dimnames[[2]],GSVA_re[,1]),(GSVA_monocle+1)]
          state_score<-data.frame(state=as.numeric(HSMM_myo@phenoData@data[["State"]]),
                                  score=HSMM_myo2@phenoData@data[["GSVA"]])
          state_mean<-aggregate(state_score,by=list(state_score$state),FUN = mean)
          root_state_GSVA<-state_mean$state[which.max(state_mean$score)]
          test=orderCells(HSMM_myo2,root_state = root_state_GSVA) 
          
          ##提取细胞坐标#########################################
          bb_monocle<-data.frame(t(as.matrix(test@reducedDimS)))
          colnames(bb_monocle)<-c("tSNE_1","tSNE_2")
          bb_monocle$Pseudotime<-test@phenoData@data[,"Pseudotime"]
          bb_monocle$GSVA<-test@phenoData@data[,"GSVA"]
          
          ##提取边坐标#################################################
          reduced_dim_coords <- reducedDimK(test)
          ica_space_df <- Matrix::t(reduced_dim_coords) %>%
            as.data.frame() %>%
            dplyr::select(prin_graph_dim_1 = 1, prin_graph_dim_2 = 2) %>%
            mutate(sample_name = rownames(.), sample_state = rownames(.))
          
          dp_mst <- minSpanningTree(test)
          
          edge_df <- dp_mst %>%
            igraph::as_data_frame() %>%
            dplyr::select(source = "from", target = "to") %>%
            left_join(ica_space_df %>% dplyr::select(source="sample_name", source_prin_graph_dim_1="prin_graph_dim_1", source_prin_graph_dim_2="prin_graph_dim_2"), by = "source") %>%
            left_join(ica_space_df %>% dplyr::select(target="sample_name", target_prin_graph_dim_1="prin_graph_dim_1", target_prin_graph_dim_2="prin_graph_dim_2"), by = "target")
          
          return_rotation_mat <- function(theta) {
            theta <- theta / 180 * pi
            matrix(c(cos(theta), sin(theta), -sin(theta), cos(theta)), nrow = 2)
          }
          rot_mat <- return_rotation_mat(0)
          
          cn2 <- c("source_prin_graph_dim_1", "source_prin_graph_dim_2")
          cn3 <- c("target_prin_graph_dim_1", "target_prin_graph_dim_2")
          edge_df[, cn2] <- as.matrix(edge_df[, cn2]) %*% t(rot_mat)
          edge_df[, cn3] <- as.matrix(edge_df[, cn3]) %*% t(rot_mat)
          
          edge_df$source_paste<-lapply(1:nrow(edge_df),function(x){#x=1
            paste0('[',paste0(edge_df[x,c("source_prin_graph_dim_1","source_prin_graph_dim_2")],collapse = ','),']')
          })%>%unlist()
          edge_df$target_paste<-lapply(1:nrow(edge_df),function(x){#x=1
            paste0('[',paste0(edge_df[x,c("target_prin_graph_dim_1","target_prin_graph_dim_2")],collapse = ','),']')
          })%>%unlist()
          edge_df$source_target<-lapply(1:nrow(edge_df),function(x){#x=1
            paste0(edge_df[x,c("source_paste","target_paste")],collapse = ',')
          })%>%unlist()
          
          mst_branch_nodes <- test@auxOrderingData[[test@dim_reduce_type]]$branch_points
          
          #############转为json格式############################################
          monocle_json<-paste0(paste0('"cell"',':','"',paste0(rownames(bb_monocle),collapse = ","),'"'),',','\n',
                               paste0('"tsne_x"',':','"',paste0(bb_monocle$tSNE_1,collapse = ","),'"'),',','\n',
                               paste0('"tsne_y"',':','"',paste0(bb_monocle$tSNE_2,collapse = ","),'"'),',','\n',
                               paste0('"Pseudotime"',':','"',paste0(bb_monocle$Pseudotime,collapse = ","),'"'),',','\n',
                               paste0('"CSscore"',':','"',paste0(bb_monocle$GSVA,collapse = ","),'"'),',','\n',
                               paste0('"edges_coordinate"',':','"',paste0(edge_df$source_targe,collapse = ";"),'"'),',','\n',
                               paste0('"cscore_max"',':','"',max(bb_monocle$GSVA),'"'),',','\n',
                               paste0('"time_max"',':','"',max(bb_monocle$Pseudotime),'"')
          )
          monocle_json<-paste0('{','\n',
                               monocle_json,'\n',
                               '}')
          write.table(monocle_json,paste0(GSVA_dir,"/",all_geneset[GSVA_monocle],"/","CS_monocle.txt"),
                      quote = F,sep = '\t',row.names = F,col.names = F)
          ###输出
        }
      }
    },error = function(e){
      monocle_stopMessage<-"Monocle of GSVA cannot be calculated"
      write.table(monocle_stopMessage,paste0(GSVA_dir,"/","monocle_stopMessage.txt"),
                   quote = F,sep = '\t',row.names = F,col.names = F)
      return(monocle_stopMessage)
    })
    
    
  }else{
    stopMessage_ccc<-"The sample size is less than 2"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage_ccc,'"}')
    write.table(stopMessage_ccc,paste0(file_out,"/stopMessage_2.txt"),
                quote = F,sep = "\t",row.names = F,col.names = F)
    return(result_message)
  }


	stopMessage<-"no"
	Task_ID_new[which(Task_ID_new[,1]==UserTaskID),2] <- "success_mult"
    write.table(Task_ID_new,paste0(externalData_dir,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
	result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
  return(result_message)
  },error = function(e){
    stopMessage<-"something wrong"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    Task_ID_new[which(Task_ID_new[,1]==UserTaskID),2] <- "dead_mult"
    write.table(Task_ID_new,paste0(externalData_dir,"/Job_ID.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
    return(result_message)
    
  })
}


