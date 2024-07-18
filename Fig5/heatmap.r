##########inputfile:1)Drug.matrix.txt or Arm.matrix.txt;2)S69.group.txt ##################################

#mydata<-read.table("Drug.matrix.txt",header = T,sep="\t",check.names = F,row.names = 1)
mydata<-read.table("ARM.matrix.txt",header = T,sep="\t",check.names = F,row.names = 1)
mydata<-mydata[,-70]

group<-read.table("S69.group.txt",header = T,row.names = 1,sep="\t")

ann_colors = list(
    Group = c(Acute = "#F8766d", Chronic = "#619cff", Control = "#00ba38")
)
head(ann_colors)


library(pheatmap)

pheatmap(mydata,cluster_cols = F,color =c("#fcfff9","#00bfc4","#C77CFF"),
         legend_breaks=c(0,1,2),border_color = "#fcfff9",gaps_col=c(23,50),
         annotation_col=group,annotation_colors=ann_colors)
