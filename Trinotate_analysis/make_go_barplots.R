#!/usr/bin/env Rscript
#plotting GO terms 
setwd("~/Documents/Final_thesis/Analysis/Annotation/GO_terms")
go_slim_terms <- read.csv("go_slim_mappings.csv", header=FALSE)
head(go_slim_terms)
head(go_slim_terms)

go_slim_terms_edited = go_slim_terms[-73,]
go_slim_terms_edited = go_slim_terms[-108,]
go_slim_terms_edited = go_slim_terms[-1,]
go_slim_terms_edited = go_slim_terms[-72,]
go_slim_terms_edited = go_slim_terms[-106,]

colnames(go_slim_terms_edited) <- c("Category", "GO", "GO_term", "Count", "Description", "empty")



biological_processes <- subset(go_slim_terms[1:20,])
biological_processes <- biological_processes[-1,]
colnames(biological_processes) <- c("Category", "GO", "GO_term", "Count", "Description", "empty")


cellular_processes <- subset(go_slim_terms[74:94,])
cellular_processes <- cellular_processes[-1,]
colnames(cellular_processes) <- c("Category", "GO", "GO_term", "Count", "Description", "empty")

molecular_processes <-subset(go_slim_terms[110:130,])
molecular_processes <- molecular_processes[-1,]
colnames(molecular_processes) <- c("Category", "GO", "GO_term", "Count", "Description", "empty")

all_go_edited <- rbind(biological_processes, molecular_processes, cellular_processes)
colnames(all_go_edited) <- c("Category", "GO", "GO_term", "Count", "Description", "empty")
library(ggplot2)
library(RColorBrewer)

overall_barplot <- ggplot(all_go_edited, aes(x= reorder(GO_term, Count), y=Count)) + 
  geom_bar(width = 0.6, aes(fill = factor(Category)), stat="identity")  + scale_fill_brewer(palette = "Dark2") +
  xlab("GO Terms") + ylab("Number of transcripts") + theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 9.5, face = "bold")) 
overall_barplot

library(ggplot2)


biological_process_counts<- ggplot(biological_processes, aes(x= reorder(GO_term, Count), y=Count)) + 
  geom_bar(colour="black", fill="#d95f02", stat="identity") + coord_flip() + 
  xlab(NULL) + ylab("Number of transcripts")  +theme_classic() + 
  theme(text = element_text(size=25)) + ggtitle("Biolgical Processes") + 
  theme(plot.title = element_text(hjust = 0, size = 30)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)))
biological_process_counts

cellular_processes_counts <- ggplot(cellular_processes, aes(x= reorder(GO_term,Count), y=Count)) + 
  geom_bar(colour="black", fill="#1b9e77", stat="identity") + coord_flip() + 
  xlab(NULL) + ylab("Number of transcripts") + theme_classic() + 
  theme(axis.text.x = element_text(hjust = 1, size = 9.5)) + theme(text = element_text(size=25)) +
  ggtitle("Cellular Components") + 
  theme(plot.title = element_text(hjust = 0, size = 30)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)))
cellular_processes_counts
molecular_processes_counts <-  ggplot(molecular_processes, aes(x= reorder(GO_term,Count), y=Count)) + 
  geom_bar(colour="black", fill= "#7570b3", stat="identity") + coord_flip() + 
  xlab(NULL) + ylab("Number of transcripts") + theme_classic() + 
  theme(text = element_text(size=25)) + ggtitle("Molecular Functions") + 
  theme(plot.title = element_text(hjust = 0, size = 30)) +
  theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0)))
molecular_processes_counts
library(grid)
library(gridExtra)
biological_process_counts
cellular_processes_counts
molecular_processes_counts
grid.arrange(biological_process_counts, molecular_processes_counts, cellular_processes_counts)
