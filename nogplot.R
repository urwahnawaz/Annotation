# plots for eggnog

legend= c("A: RNA processing and modification", "B: Chromatin structure and dynamics",
          "C: Energy production and conversion ","D: Cell cycle control, cell division, chromosome partitioning",
          "E: Amino acid transport and metabolism", 
          "F: Nucleotide transport and metabolism", 
          "G: Carbohydrate transport and metabolism", 
          "H: Coenzyme transport and metabolism", 
          "I: Lipid transport and metabolism", "J: Translation, ribosomal structure and biogenesis", 
          "K: Transcription", "L: Replication, recombination and repair", 
          "M: Cell wall/membrane/envelope biogenesis", "N	Cell motility"  ,"O: Posttranslational modification, protein turnover, chaperones",
          "P: Inorganic ion transport and metabolism", 
          "Q: Secondary metabolites biosynthesis, transport and catabolism", 
          "R: General function prediction only", "S: Function unknown",
          "T: Signal transduction mechanisms", "U: Intracellular trafficking, secretion, and vesicular transport",
          "V: Defense mechanisms", 
          "W: Extracellular structures", 
          "Y: Nuclear structure",
          "Z: Cytoskeleton")

counts= c(21, 8, 73, 13, 65, 51, 67,  51, 47, 177, 61,67, 24, 3, 92, 38, 17, 157, 84, 24, 36, 5, 0, 1, 8 )
FunctionClass = factor(c("A", "B", "C", "D", "E", "F", "G", "H", "I",     "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "Y", "Z"), 
                       levels=c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "Y", "Z"))


eggnog_counts <- data.frame(legend, counts, FunctionClass)

library(ggplot2)
library(ggsci)

p <- ggplot(eggnog_counts, aes(x=FunctionClass, y=counts, fill=legend))+
  geom_bar(stat="identity", position=position_dodge())
p + guides (fill = guide_legend(ncol = 1))+
  xlab("Factor Class")  + scale_fill_igv() + theme_bw() + ylab("Frequency") + 
  theme(axis.text.x = element_text(face="bold", size=10))


eggnog_term <- c("Translation, ribosomal structure and biogenesis",
                 "General function prediction only ",
                 "Posttranslational modification, protein turnover, chaperones",
                 "Function unknown", "Energy production and conversion ",
                 "Carbohydrate transport and metabolism", 
                 "Replication, recombination and repair",
                 "Amino acid transport and metabolism",
                 "Transcription",
                 "Coenzyme transport and metabolism",
                 "Nucleotide transport and metabolism",
                 "Lipid transport and metabolism",
                 "Inorganic ion transport and metabolism",
                 "Intracellular trafficking, secretion, and vesicular transport",
                 "Signal transduction mechanisms",
                 "Cell wall/membrane/envelope biogenesis",
                 "RNA processing and modification",
                 "Secondary metabolites biosynthesis, transport and catabolism",
                 "Cell cycle control, cell division, chromosome partitioning", 
                 "Cytoskeleton",
                 "Chromatin structure and dynamics",
                 "Defense mechanisms")


counts <- c(177, 157, 92, 84, 73, 67, 67, 65, 61, 51, 51, 47, 38,
            36, 24, 24, 21, 17, 13, 8, 8, 5)
total_eggnog <- data.frame(eggnog_term, counts)

library(ggplot2)

eggnog_plot <- ggplot(total_eggnog, aes(x=eggnog_term,y = counts)) +
  geom_bar(fill="slateblue4", stat = "identity") + 
  coord_flip() + ylab("Counts") + xlab(NULL) + theme_bw() + 
