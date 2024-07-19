
mydata<-read.table("ARO.input.txt",header = T,sep="\t",check.names = F)

comparelist<-list(c("Acute", "Chronic"), 
                  c("Acute", "Control"), c("Chronic", "Control"))


cols <- c("Acute" = "#f8766d", "Chronic" = "#619cff", "Control" = "#00ba38")


library(ggplot2)
library(ggpubr)
p0<-ggplot(mydata,aes(x = Group, y = `ARM gene Family Number`,color=Group)) + 
         geom_boxplot()+
        geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+scale_color_manual(values=cols)


#######output all ##################

#1)APH(3'')	
#2)APH(6)	
#3)OXA beta-lactamase	
#4)Penicillin-binding protein mutations conferring resistance to beta-lactam antibiotics	
#5)TEM beta-lactamase	
#6)elfamycin resistant EF-Tu	
#7)glycopeptide resistance gene cluster	
#8)major facilitator superfamily (MFS) antibiotic efflux pump	
#9)multidrug and toxic compound extrusion (MATE) transporter	
#10)sulfonamide resistant sul	
#11)tetracycline-resistant ribosomal protection protein


p1<-ggplot(mydata,aes(x = Group, 
                      y = `APH(3)`,color=Group)) + 
  geom_violin()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  scale_color_manual(values=cols)

p2<-ggplot(mydata,aes(x = Group, 
                      y = `APH(6)`,color=Group)) + 
  geom_violin()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  scale_color_manual(values=cols)

p3<-ggplot(mydata,aes(x = Group, 
                      y = `OXA beta-lactamase`,color=Group)) + 
  geom_violin()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  scale_color_manual(values=cols)


p4<-ggplot(mydata,aes(x = Group, 
                  y = `Penicillin-binding protein mutations conferring resistance to beta-lactam antibiotics`,color=Group)) + 
  geom_violin()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  labs(y="PBP mutations conferring\nresistance to β-lactams")
  scale_color_manual(values=cols)


p5<-ggplot(mydata,aes(x = Group, 
                  y = `TEM beta-lactamase`,color=Group)) + 
  geom_violin()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  scale_color_manual(values=cols)


p6<-ggplot(mydata,aes(x = Group, 
                  y = `elfamycin resistant EF-Tu`,color=Group)) + 
  geom_violin()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  scale_color_manual(values=cols)


p8<-ggplot(mydata,aes(x = Group, 
                      y = `major facilitator superfamily (MFS) antibiotic efflux pump`,color=Group)) + 
  geom_violin()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  labs(y="MFS antibiotic efflux pump")+
  scale_color_manual(values=cols)


library(gridExtra)
#grid.arrange(p1,p2,p3,p5,p6,nrow=2)
#grid.arrange(p0,p4,p8,nrow=1)
grid.arrange(p0,p4,p5,p8,p6,nrow=2)


####################not used for Drug class in version 1 ######################

#1)
ggplot(mydata,aes(x = Group, y = `aminoglycoside antibiotic`,color=Group)) + 
  geom_boxplot()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  scale_color_manual(values=cols)
#2)
ggplot(mydata,aes(x = Group, y = `cephalosporin`,color=Group)) + 
  geom_boxplot()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  scale_color_manual(values=cols)

#3)elfamycin antibiotic
ggplot(mydata,aes(x = Group, y = `elfamycin antibiotic`,color=Group)) + 
  geom_boxplot()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  scale_color_manual(values=cols)

#4)monobactam
ggplot(mydata,aes(x = Group, y = `monobactam`,color=Group)) + 
  geom_boxplot()+
  geom_point(position=position_jitter(0.1),size=2,aes(color=Group))+
  stat_compare_means(comparisons=comparelist)+xlab("")+theme_bw()+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  scale_color_manual(values=cols)


