innerpath="E:/0_webserve/2_methods/innerpath"
geneset=read.table(paste0(innerpath,"/","geneset.txt"),header = F,sep = "\t",check.names = F,fill = T)
geneset[1:3,]
colnames(geneset)=c("geneSetName","genes")
genesetList=list()
for (i in 1:dim(geneset)[1]){
  genesetList[[i]]=unlist(strsplit(as.character(geneset[i,2]),","))
}
names(genesetList)=as.character(geneset$geneSetName)

saveRDS(genesetList,paste0(innerpath,"/","GSVAgeneset.Rds"))
genesetList=readRDS(paste0(innerpath,"/","GSVAgeneset.Rds"))
genesetList[["Ben_Myc_targets1"]]
