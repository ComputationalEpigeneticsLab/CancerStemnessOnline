

# filePath="E:/0_webserve/4_example/single/web-test"
# innerpath<-"E:/0_webserve/2_methods/innerpath"

RNA_v<-function(filePath,innerpath){
  suppressMessages({
    library(dplyr)
    library(jsonlite)
    library(stringr)
    library(psych)
    library(ggplot2)
    library(monocle)
    library(Seurat)
  })
  filePath=filePath
  innerpath=innerpath
  tryCatch({
  outpath<-paste0(filePath,"/RNA_v")
  if(!dir.exists(outpath)){      dir.create(outpath)    }
  ####1.read base infor #####
  source(paste0(innerpath,"/","resultFunctionMethod.R"))
  baseinfor_list=read_json(paste0(filePath,"/CS_re.txt"))
  
  csScore=read.table(paste0(filePath,"/CSscore_tableDownload.txt"),header = T,sep = "\t",as.is=TRUE,quote = "",check.names = F)
  expressionFile_all <- read.table(paste0(filePath,"/",baseinfor_list[["ExpfileName"]]),header = T,sep = "\t",as.is=TRUE,quote = "",row.names = 1,check.names = F)
  expressionFile<-expressionFile_all[,csScore$samplename]
  rownames(csScore)=csScore$samplename
  
  count_object <- CreateSeuratObject(counts = as.matrix(expressionFile), project = "myproject", 
                                     min.cells = 3, min.features = 200)
  
  
  data <- as(as.matrix(count_object@assays$RNA@counts), 'sparseMatrix')
  pd <- new('AnnotatedDataFrame', data = count_object@meta.data)
  fData <- data.frame(gene_short_name = row.names(data), row.names = row.names(data))
  fd <- new('AnnotatedDataFrame', data = fData)
  
  HSMM <- newCellDataSet(data,
                         phenoData = pd,
                         featureData = fd,
                         lowerDetectionLimit = 0.5,
                         expressionFamily = negbinomial.size())
  HSMM <- estimateSizeFactors(HSMM)   
  HSMM <- estimateDispersions(HSMM)
  HSMM <- detectGenes(HSMM, min_expr = 0.1) 
  
  disp_table <- dispersionTable(HSMM)
  unsup_clustering_genes <- subset(disp_table, mean_expression >= 0.1) 
  HSMM_myo <- setOrderingFilter(HSMM, unsup_clustering_genes$gene_id)
  
  expressed_genes <- row.names(subset(fData(HSMM),num_cells_expressed >= 10))
  
  HSMM_ordering_genes <-expressed_genes
  HSMM_myo <-setOrderingFilter(HSMM_myo,ordering_genes = HSMM_ordering_genes)
  HSMM_myo <-reduceDimension(HSMM_myo, max_components = 2,method = 'DDRTree')###这一步非常慢
  HSMM_myo <-orderCells(HSMM_myo)
  
  ####找到干性得分均值最大的簇
	state_score<-data.frame(state=as.numeric(HSMM_myo@phenoData@data[["State"]]),
                        score=csScore[match(data@Dimnames[[2]],csScore$sample),2])
	state_mean<-aggregate(state_score,by=list(state_score$state),FUN = mean)
	root_state_CytoTRACE<-state_mean$state[which.max(state_mean$score)]
	test=orderCells(HSMM_myo,root_state = root_state_CytoTRACE)

  
  HSMM_myo2<-HSMM_myo
  HSMM_myo2@phenoData@data[["CSscore"]]<-csScore[data@Dimnames[[2]],2]
  
  p1=plot_cell_trajectory(test, color_by = "Pseudotime",cell_size = 2,show_branch_points = F)
  p2=plot_cell_trajectory(HSMM_myo2, color_by = "CSscore",cell_size = 2,show_branch_points = F) +scale_color_gradient(low = "white",high = "#8C183D")
  # plot_cell_trajectory(obj, color_by = "Pseudotime")+scale_color_gradient(low = "cyan",high = "red")
  ggsave(paste0(outpath,"/","RNA_v.png"),p1, width = 1800,  height = 1600, 
         units = "px",  bg = "white",  dpi = 300)
  ggsave(paste0(outpath,"/","RNA_score.png"),p2, width = 1800,  height = 1600, 
         units = "px",  bg = "white",  dpi = 300)
  
  ####out####
  stopMessage<-"no"
  RNA_v="success"
  out_end <- paste0("{","\n",
                    '"dataType" :','"',baseinfor_list$dataType,'",',"\n",
                    '"method" :','"',baseinfor_list$method,'",',"\n",
                    '"JobID" :','"',baseinfor_list$JobID,'",',"\n",
                    '"RNA_v" :','"',RNA_v,'",',"\n",
                    '"SampleNumAll" :','"',baseinfor_list$SampleNumAll,'",',"\n",
                    '"SampleNumCancer" :','"',baseinfor_list$SampleNumCancer,'",',"\n",
                    '"GeneNumAll" :','"',baseinfor_list$GeneNumAll,'",',"\n",
                    '"CStable_webName" :','"',baseinfor_list$CStable_webName,'",',"\n",
                    '"CStable_downloadName" :','"',baseinfor_list$CStable_downloadName,'",',"\n",
                    '"barplot_Num" :','"',baseinfor_list$barplot_Num,'",',"\n",
                    '"ExpfileName" :','"',baseinfor_list$ExpfileName,'",',"\n",
                    '"SamplefileName" :','"',baseinfor_list$SamplefileName,'",',"\n",
                    '"email_address" :','"',baseinfor_list$email_address,'",',"\n",
                    '"Sample_source_error" :','"',baseinfor_list$Sample_source_error,'",',"\n",
                    '"Sample_source_color" :','"',baseinfor_list$Sample_source_color,'",',"\n",
                    '"Sample_source_label" :','"',baseinfor_list$Sample_source_label,'",',"\n",
                    '"Sample_source_value_pie" :','"',baseinfor_list$Sample_source_value_pie,'",',"\n",
                    '"Sample_source_violin_filename" :','"',baseinfor_list$Sample_source_violin_filename,'",',"\n",
                    '"Drug_treatment_error" :','"',baseinfor_list$Drug_treatment_error,'",',"\n",
                    '"Drug_treatment_color" :','"',baseinfor_list$Drug_treatment_color,'",',"\n",
                    '"Drug_treatment_label" :','"',baseinfor_list$Drug_treatment_label,'",',"\n",
                    '"Drug_treatment_value_pie" :','"',baseinfor_list$Drug_treatment_value_pie,'",',"\n",
                    '"Drug_treatment_violin_filename" :','"',baseinfor_list$Drug_treatment_violin_filename,'",',"\n",
                    '"stopMessage" :','"',stopMessage,'"',"\n",
                    '}'
                    
  )
  write.table(out_end,paste0(filePath,"/","CS_re.txt"),quote = F,sep = "\t",row.names = F,col.names = F)
  
  
  
  result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
  return(result_message)
  },error = function(e){
    stopMessage<-"something wrong"
    result_message <- paste0("{",'"error_attention" :','"',stopMessage,'"}')
    
    return(result_message)
    
  })
}