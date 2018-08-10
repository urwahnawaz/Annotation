#!/usr/bin/env Rscript
library(GOplot)

#goplot for embryo
EC.david = read.table("EC.david", sep='\t', header=TRUE, fill = TRUE, stringsAsFactors = FALSE, quote = "")
EC.genelist = read.table("EC.genelist", sep = '\t', header=TRUE, fill = TRUE, stringsAsFactors = FALSE, quote = "")
EC.genelist
EC.david
head(EC.david$ID,90)

circ <- circle_dat(EC.david, EC.genelist)
GOBubble(circ, labels = 3)
GOBubble(circ, title = 'Bubble plot with background colour', display = 'multiple', bg.col = T, labels = 3)  
IDs <- c("GO:0048856", "GO:0032502", "GO:0030182", "GO:0007411", "GO:0008283", "GO:0048729", "GO:0004930", "GO:0048592", 
         "GO:0035138", "GO:0009880", "GO:0072073", "GO:0042813", "GO:0014036")
GOCircle(circ, nsub = IDs, label.size = 4)
GOCircle(circ)

EC.david_kidney = read.table("~/Documents/Final_thesis/Analysis/Expression_analysis/edgeR_transcript/goplot_kidney/EC.david",
                             sep = '\t', header=T)

EC.genelist_kidney= read.table("~/Documents/Final_thesis/Analysis/Expression_analysis/edgeR_transcript/goplot_kidney/EC.genelist",
                               sep = '\t', header=T)

circ_kidney <- circle_dat(EC.david_kidney, EC.genelist_kidney)

head(EC.david_kidney$Term,40)
head(EC.genelist_kidney,1)
circ_kidney$count

IDs <- c("GO:0006810", "GO:0036094", "GO:0008152", "GO:0006811", "GO:0005215", "GO:0032006", "GO:0051716", "GO:0055088",
         "GO:0008152", "GO:1901998", "GO:0050808", "GO:0043167", "GO:0009987", "GO:0010070")
GOCircle(circ_kidney, nsub = IDs)

GOCircle(circ_kidney, nsub=10)

GOBar(subset(circ_kidney, category == 'BP'))
GOBubble(circ_kidney, labels = 3)

EC.david = read.table("EC.david", sep='\t', header=T)
EC.genelist = read.table("EC.genelist", sep = '\t', header=T)
circ <- circle_dat(EC.david, EC.genelist)
IDs <- c("GO:0048856", "GO:0032502", "GO:0030182", "GO:0007411", "GO:0008283", "GO:0048729", "GO:0004930", "GO:0048592", 
         "GO:0035138", "GO:0009880", "GO:0072073", "GO:0042813", "GO:0014036", "GO:0006810", "GO:0036094", "GO:0008152", "GO:0006811", "GO:0005215", "GO:0032006", "GO:0051716", "GO:0055088",
         "GO:0008152", "GO:1901998", "GO:0050808", "GO:0043167", "GO:0009987", "GO:0010070", "GO:000760", "GO:0097062")
GOCircle(circ, nsub=IDs, rad2 = 3.15)
