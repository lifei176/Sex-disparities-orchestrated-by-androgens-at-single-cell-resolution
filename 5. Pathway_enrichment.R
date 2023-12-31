library(DOSE)
library(enrichplot)
library(clusterProfiler)
options(connectionObserver = NULL)
library(org.Mm.eg.db)
library(biomaRt)

deg<-read.csv('DEG_filter.csv')

deg$tissue_cell_type<-paste0(deg$Tissue,"_",deg$Cell_type,sep="")
deg_MSVSFS<-deg[which(deg$Comparison=="MSvsFS"),]
deg_MCVSMS<-deg[which(deg$Comparison=="MCvsMS"),]
deg_FDVSFS<-deg[which(deg$Comparison=="FDvsFS"),]

###################Pathway enrichment based on the DEGs in each cell type
###################
###################
###################
###################
###################
###################

#############MSVSFS_up
deg_MSVSFS_up<-deg_MSVSFS[which(deg_MSVSFS$Change=="Up"),]
cell_MSVSFS_up<-names(table(deg_MSVSFS_up$tissue_cell_type))
length(cell_MSVSFS_up)
deg_MSVSFS_up_go_data<-data.frame()
for (i in 1:length(cell_MSVSFS_up)){
  deg_MSVSFS_up_1<-deg_MSVSFS_up[which(deg_MSVSFS_up$tissue_cell_type==cell_MSVSFS_up[i]),]
  tryCatch({
    gene_id <- bitr(unique(deg_MSVSFS_up_1$Gene_symbol), fromType = "SYMBOL",
                    toType = c("ENSEMBL", "SYMBOL","ENTREZID"),
                    OrgDb = org.Mm.eg.db)
    pathway_up_go <- enrichGO(gene      = gene_id$ENTREZID,
                              OrgDb         = org.Mm.eg.db,
                              ont           = "BP",
                              pAdjustMethod = "BH",
                              pvalueCutoff  = 0.01,
                              qvalueCutoff  = 0.01,
                              readable      = TRUE)
    dim(pathway_up_go)
    pathway_up_go_data<-data.frame(pathway_up_go)
    pathway_up_go_data$tissue<-rep(unique(deg_MSVSFS_up_1$Tissue),nrow(pathway_up_go_data))
    pathway_up_go_data$tissue_cell_type<-rep(unique(deg_MSVSFS_up_1$tissue_cell_type),nrow(pathway_up_go_data))
    pathway_up_go_data$cell_type<-rep(unique(deg_MSVSFS_up_1$Cell_type),nrow(pathway_up_go_data))
    
    pathway_up_go_data$change<-rep("up",nrow(pathway_up_go_data))
    deg_MSVSFS_up_go_data<-rbind(deg_MSVSFS_up_go_data,pathway_up_go_data)
  },
  error=function(e){}
  )
}
length(table(deg_MSVSFS_up_go_data$tissue_cell_type))
dim(deg_MSVSFS_up_go_data)
write.csv(deg_MSVSFS_up_go_data,"deg_MSVSFS_up_go_data.csv")

#############MSVSFS_down
deg_MSVSFS_down<-deg_MSVSFS[which(deg_MSVSFS$Change=="Down"),]
cell_MSVSFS_down<-names(table(deg_MSVSFS_down$tissue_cell_type))
length(cell_MSVSFS_down)

deg_MSVSFS_down_go_data<-data.frame()
for (i in 1:length(cell_MSVSFS_down)){
  deg_MSVSFS_down_1<-deg_MSVSFS_down[which(deg_MSVSFS_down$tissue_cell_type==cell_MSVSFS_down[i]),]
  tryCatch({
    gene_id <- bitr(unique(deg_MSVSFS_down_1$Gene_symbol), fromType = "SYMBOL",
                    toType = c("ENSEMBL", "SYMBOL","ENTREZID"),
                    OrgDb = org.Mm.eg.db)
    pathway_up_go <- enrichGO(gene      = gene_id$ENTREZID,
                              OrgDb         = org.Mm.eg.db,
                              ont           = "BP",
                              pAdjustMethod = "BH",
                              pvalueCutoff  = 0.01,
                              qvalueCutoff  = 0.01,
                              readable      = TRUE)
    dim(pathway_up_go)
    pathway_up_go_data<-data.frame(pathway_up_go)
    pathway_up_go_data$tissue<-rep(unique(deg_MSVSFS_down_1$Tissue),nrow(pathway_up_go_data))
    pathway_up_go_data$tissue_cell_type<-rep(unique(deg_MSVSFS_down_1$tissue_cell_type),nrow(pathway_up_go_data))
    pathway_up_go_data$cell_type<-rep(unique(deg_MSVSFS_down_1$Cell_type),nrow(pathway_up_go_data))
    
    pathway_up_go_data$change<-rep("down",nrow(pathway_up_go_data))
    deg_MSVSFS_down_go_data<-rbind(deg_MSVSFS_down_go_data,pathway_up_go_data)
  },
  error=function(e){}
  )
}
length(table(deg_MSVSFS_down_go_data$tissue_cell_type))
dim(deg_MSVSFS_down_go_data)
write.csv(deg_MSVSFS_down_go_data,"deg_MSVSFS_down_go_data.csv")

#############MCVSMS_up
deg_MCVSMS_up<-deg_MCVSMS[which(deg_MCVSMS$Change=="Up"),]
cell_MCVSMS_up<-names(table(deg_MCVSMS_up$tissue_cell_type))
length(cell_MCVSMS_up)

deg_MCVSMS_up_go_data<-data.frame()
for (i in 1:length(cell_MCVSMS_up)){
  deg_MCVSMS_up_1<-deg_MCVSMS_up[which(deg_MCVSMS_up$tissue_cell_type==cell_MCVSMS_up[i]),]
  tryCatch({
    gene_id <- bitr(unique(deg_MCVSMS_up_1$Gene_symbol), fromType = "SYMBOL",
                    toType = c("ENSEMBL", "SYMBOL","ENTREZID"),
                    OrgDb = org.Mm.eg.db)
    pathway_up_go <- enrichGO(gene      = gene_id$ENTREZID,
                              OrgDb         = org.Mm.eg.db,
                              ont           = "BP",
                              pAdjustMethod = "BH",
                              pvalueCutoff  = 0.01,
                              qvalueCutoff  = 0.01,
                              readable      = TRUE)
    dim(pathway_up_go)
    pathway_up_go_data<-data.frame(pathway_up_go)
    pathway_up_go_data$tissue<-rep(unique(deg_MCVSMS_up_1$Tissue),nrow(pathway_up_go_data))
    pathway_up_go_data$tissue_cell_type<-rep(unique(deg_MCVSMS_up_1$tissue_cell_type),nrow(pathway_up_go_data))
    pathway_up_go_data$cell_type<-rep(unique(deg_MCVSMS_up_1$Cell_type),nrow(pathway_up_go_data))
    
    pathway_up_go_data$change<-rep("up",nrow(pathway_up_go_data))
    deg_MCVSMS_up_go_data<-rbind(deg_MCVSMS_up_go_data,pathway_up_go_data)
  },
  error=function(e){}
  )
}
length(table(deg_MCVSMS_up_go_data$tissue_cell_type))
dim(deg_MCVSMS_up_go_data)
write.csv(deg_MCVSMS_up_go_data,"deg_MCVSMS_up_go_data.csv")

#############MCVSMS_down
deg_MCVSMS_down<-deg_MCVSMS[which(deg_MCVSMS$Change=="Down"),]
cell_MCVSMS_down<-names(table(deg_MCVSMS_down$tissue_cell_type))
length(cell_MCVSMS_down)

deg_MCVSMS_down_go_data<-data.frame()
for (i in 1:length(cell_MCVSMS_down)){
  deg_MCVSMS_down_1<-deg_MCVSMS_down[which(deg_MCVSMS_down$tissue_cell_type==cell_MCVSMS_down[i]),]
  tryCatch({
    gene_id <- bitr(unique(deg_MCVSMS_down_1$Gene_symbol), fromType = "SYMBOL",
                    toType = c("ENSEMBL", "SYMBOL","ENTREZID"),
                    OrgDb = org.Mm.eg.db)
    pathway_up_go <- enrichGO(gene      = gene_id$ENTREZID,
                              OrgDb         = org.Mm.eg.db,
                              ont           = "BP",
                              pAdjustMethod = "BH",
                              pvalueCutoff  = 0.01,
                              qvalueCutoff  = 0.01,
                              readable      = TRUE)
    dim(pathway_up_go)
    pathway_up_go_data<-data.frame(pathway_up_go)
    pathway_up_go_data$tissue<-rep(unique(deg_MCVSMS_down_1$Tissue),nrow(pathway_up_go_data))
    pathway_up_go_data$tissue_cell_type<-rep(unique(deg_MCVSMS_down_1$tissue_cell_type),nrow(pathway_up_go_data))
    pathway_up_go_data$cell_type<-rep(unique(deg_MCVSMS_down_1$Cell_type),nrow(pathway_up_go_data))
    
    pathway_up_go_data$change<-rep("down",nrow(pathway_up_go_data))
    deg_MCVSMS_down_go_data<-rbind(deg_MCVSMS_down_go_data,pathway_up_go_data)
  },
  error=function(e){}
  )
}
length(table(deg_MCVSMS_down_go_data$tissue_cell_type))
dim(deg_MCVSMS_down_go_data)
write.csv(deg_MCVSMS_down_go_data,"deg_MCVSMS_down_go_data.csv")

#############FDVSFS_up
deg_FDVSFS_up<-deg_FDVSFS[which(deg_FDVSFS$Change=="Up"),]
cell_FDVSFS_up<-names(table(deg_FDVSFS_up$tissue_cell_type))
length(cell_FDVSFS_up)
deg_FDVSFS_up_go_data<-data.frame()
for (i in 1:length(cell_FDVSFS_up)){
  deg_FDVSFS_up_1<-deg_FDVSFS_up[which(deg_FDVSFS_up$tissue_cell_type==cell_FDVSFS_up[i]),]
  tryCatch({
    gene_id <- bitr(unique(deg_FDVSFS_up_1$Gene_symbol), fromType = "SYMBOL",
                    toType = c("ENSEMBL", "SYMBOL","ENTREZID"),
                    OrgDb = org.Mm.eg.db)
    pathway_up_go <- enrichGO(gene      = gene_id$ENTREZID,
                              OrgDb         = org.Mm.eg.db,
                              ont           = "BP",
                              pAdjustMethod = "BH",
                              pvalueCutoff  = 0.01,
                              qvalueCutoff  = 0.01,
                              readable      = TRUE)
    dim(pathway_up_go)
    pathway_up_go_data<-data.frame(pathway_up_go)
    pathway_up_go_data$tissue<-rep(unique(deg_FDVSFS_up_1$Tissue),nrow(pathway_up_go_data))
    pathway_up_go_data$tissue_cell_type<-rep(unique(deg_FDVSFS_up_1$tissue_cell_type),nrow(pathway_up_go_data))
    pathway_up_go_data$cell_type<-rep(unique(deg_FDVSFS_up_1$Cell_type),nrow(pathway_up_go_data))
    
    pathway_up_go_data$change<-rep("up",nrow(pathway_up_go_data))
    deg_FDVSFS_up_go_data<-rbind(deg_FDVSFS_up_go_data,pathway_up_go_data)
  },
  error=function(e){}
  )
}
length(table(deg_FDVSFS_up_go_data$tissue_cell_type))
dim(deg_FDVSFS_up_go_data)
write.csv(deg_FDVSFS_up_go_data,"deg_FDVSFS_up_go_data.csv")

#############FDVSFS_down
deg_FDVSFS_down<-deg_FDVSFS[which(deg_FDVSFS$Change=="Down"),]
cell_FDVSFS_down<-names(table(deg_FDVSFS_down$tissue_cell_type))
length(cell_FDVSFS_down)

deg_FDVSFS_down_go_data<-data.frame()
for (i in 1:length(cell_FDVSFS_down)){
  deg_FDVSFS_down_1<-deg_FDVSFS_down[which(deg_FDVSFS_down$tissue_cell_type==cell_FDVSFS_down[i]),]
  tryCatch({
    gene_id <- bitr(unique(deg_FDVSFS_down_1$Gene_symbol), fromType = "SYMBOL",
                    toType = c("ENSEMBL", "SYMBOL","ENTREZID"),
                    OrgDb = org.Mm.eg.db)
    pathway_up_go <- enrichGO(gene      = gene_id$ENTREZID,
                              OrgDb         = org.Mm.eg.db,
                              ont           = "BP",
                              pAdjustMethod = "BH",
                              pvalueCutoff  = 0.01,
                              qvalueCutoff  = 0.01,
                              readable      = TRUE)
    dim(pathway_up_go)
    pathway_up_go_data<-data.frame(pathway_up_go)
    pathway_up_go_data$tissue<-rep(unique(deg_FDVSFS_down_1$Tissue),nrow(pathway_up_go_data))
    pathway_up_go_data$tissue_cell_type<-rep(unique(deg_FDVSFS_down_1$tissue_cell_type),nrow(pathway_up_go_data))
    pathway_up_go_data$cell_type<-rep(unique(deg_FDVSFS_down_1$Cell_type),nrow(pathway_up_go_data))
    
    pathway_up_go_data$change<-rep("down",nrow(pathway_up_go_data))
    deg_FDVSFS_down_go_data<-rbind(deg_FDVSFS_down_go_data,pathway_up_go_data)
  },
  error=function(e){}
  )
}
length(table(deg_FDVSFS_down_go_data$tissue_cell_type))
dim(deg_FDVSFS_down_go_data)
write.csv(deg_FDVSFS_down_go_data,"deg_FDVSFS_down_go_data.csv")


deg_MSVSFS_up_go_data<-read.csv("deg_MSVSFS_up_go_data.csv")
deg_MSVSFS_down_go_data<-read.csv("deg_MSVSFS_down_go_data.csv")
deg_MCVSMS_up_go_data<-read.csv("deg_MCVSMS_up_go_data.csv")
deg_MCVSMS_down_go_data<-read.csv("deg_MCVSMS_down_go_data.csv")
deg_FDVSFS_up_go_data<-read.csv("deg_FDVSFS_up_go_data.csv")
deg_FDVSFS_down_go_data<-read.csv("deg_FDVSFS_down_go_data.csv")

deg_go_data<-rbind(deg_MSVSFS_up_go_data,deg_MSVSFS_down_go_data,deg_MCVSMS_up_go_data,deg_MCVSMS_down_go_data,deg_FDVSFS_up_go_data,deg_FDVSFS_down_go_data)
deg_go_data$comparison<-c(rep("MSvsFS",(nrow(deg_MSVSFS_up_go_data)+nrow(deg_MSVSFS_down_go_data))),
                          rep("MCvsMS",(nrow(deg_MCVSMS_up_go_data)+nrow(deg_MCVSMS_down_go_data))),
                          rep("FDvsFS",(nrow(deg_FDVSFS_up_go_data)+nrow(deg_FDVSFS_down_go_data)))
)

write.csv(deg_go_data,"deg_go_data.csv")

###################Pathway enrichment based on the AASB-DEGs in each cell type
###################
###################
###################
###################
###################
###################
AASB_DEG<-read.csv("AASB_DEG.csv")
###################Positive AASB-DEG
AASB_DEG_positive<-droplevels(AASB_DEG[which(AASB_DEG$Change=="Positive"),])
tissue_positive<-names(table(AASB_DEG_positive$Tissue))

AASB_DEG_positive$tissue_cell_type<-paste0(AASB_DEG_positive$Tissue,"_",AASB_DEG_positive$Cell_type,sep="")
cell_positive<-names(table(AASB_DEG_positive$tissue_cell_type))#142

pathway_positive_go_data_all<-data.frame()
for (i in 1:length(cell_positive)){
  tryCatch({
  AASB_DEG_positive_1<-AASB_DEG_positive[which(AASB_DEG_positive$tissue_cell_type==cell_positive[i]),]
  gene_id_positive <- bitr(unique(AASB_DEG_positive_1$Gene), fromType = "SYMBOL",
                           toType = c("ENSEMBL", "SYMBOL","ENTREZID"),
                           OrgDb = org.Mm.eg.db)
  pathway_up_go <- enrichGO(gene      = gene_id_positive$ENTREZID,
                            OrgDb         = org.Mm.eg.db,
                            ont           = "BP",
                            pAdjustMethod = "BH",
                            pvalueCutoff  = 0.01,
                            qvalueCutoff  = 0.01,
                            readable      = TRUE)
  dim(pathway_up_go)
  pathway_up_go_data<-data.frame(pathway_up_go)
  pathway_up_go_data$tissue<-rep(unique(AASB_DEG_positive_1$Tissue),nrow(pathway_up_go_data))
  pathway_up_go_data$tissue_cell_type<-rep(unique(AASB_DEG_positive_1$tissue_cell_type),nrow(pathway_up_go_data))
  pathway_up_go_data$Cell_type<-rep(unique(AASB_DEG_positive_1$Cell_type),nrow(pathway_up_go_data))
  
  pathway_up_go_data$change<-rep("Positive",nrow(pathway_up_go_data))
  pathway_positive_go_data_all<-rbind(pathway_positive_go_data_all,pathway_up_go_data)
  },
  error=function(e){}
  )
}

###################Negative AASB-DEG
AASB_DEG_negative<-droplevels(AASB_DEG[which(AASB_DEG$Change=="Negative"),])
tissue_negative<-names(table(AASB_DEG_negative$Tissue))

AASB_DEG_negative$tissue_cell_type<-paste0(AASB_DEG_negative$Tissue,"_",AASB_DEG_negative$Cell_type,sep="")
cell_negative<-names(table(AASB_DEG_negative$tissue_cell_type))#106

pathway_negative_go_data_all<-data.frame()
for (i in 1:length(cell_negative)){
  tryCatch({
    AASB_DEG_negative_1<-AASB_DEG_negative[which(AASB_DEG_negative$tissue_cell_type==cell_negative[i]),]
    gene_id_negative <- bitr(unique(AASB_DEG_negative_1$Gene), fromType = "SYMBOL",
                             toType = c("ENSEMBL", "SYMBOL","ENTREZID"),
                             OrgDb = org.Mm.eg.db)
    pathway_down_go <- enrichGO(gene      = gene_id_negative$ENTREZID,
                              OrgDb         = org.Mm.eg.db,
                              ont           = "BP",
                              pAdjustMethod = "BH",
                              pvalueCutoff  = 0.01,
                              qvalueCutoff  = 0.01,
                              readable      = TRUE)
    dim(pathway_down_go)
    pathway_down_go_data<-data.frame(pathway_down_go)
    pathway_down_go_data$tissue<-rep(unique(AASB_DEG_negative_1$Tissue),nrow(pathway_down_go_data))
    pathway_down_go_data$tissue_cell_type<-rep(unique(AASB_DEG_negative_1$tissue_cell_type),nrow(pathway_down_go_data))
    pathway_down_go_data$Cell_type<-rep(unique(AASB_DEG_negative_1$Cell_type),nrow(pathway_down_go_data))
    
    pathway_down_go_data$change<-rep("Negative",nrow(pathway_down_go_data))
    pathway_negative_go_data_all<-rbind(pathway_negative_go_data_all,pathway_down_go_data)
  },
  error=function(e){}
  )
}

Pathway_AASB_DEG<-rbind(pathway_positive_go_data_all,pathway_negative_go_data_all)
dim(Pathway_AASB_DEG)
write.csv(Pathway_AASB_DEG,"Pathway_AASB_DEG.csv")

###################qvalue<0.01
Pathway_AASB_DEG_final<-Pathway_AASB_DEG[which(Pathway_AASB_DEG$qvalue<0.01),]
write.csv(Pathway_AASB_DEG_final,"Pathway_AASB_DEG_final.csv")




