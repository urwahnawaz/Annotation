# full-length analysis 

per_cov=c(10,20, 30, 40, 50, 60, 70, 80, 90, 100)
proteins_blastp=c(627, 1486, 1617, 1616, 1647, 1624, 1666, 1856, 2441, 5650)
coverage_blastp <- data.frame(per_cov, proteins_blastp)
coverage_blastp

proteins_blastx=c(1055, 1906, 1783, 1636, 1611, 1620, 1807, 2122, 2777, 5679)

coverage_blastx <- data.frame(per_cov, proteins_blastx)

library(ggplot2)
library(grid)
library(gridExtra)

blastp <- ggplot(coverage_blastp, aes(x=per_cov, y=proteins_blastp)) + geom_bar(color ="black",  stat = "identity") +
  xlab("Percent Transcript Coverage") + theme_bw() + ylab("Transcripts") +  theme(axis.text.x = element_text(size=10)) + 
  scale_x_continuous(labels=as.character(per_cov), breaks = per_cov)

blastx <- ggplot(coverage_blastx, aes(x=per_cov, y=proteins_blastx)) + geom_bar(color ="black",  stat = "identity") +
   theme_bw() + ylab("Transcripts") + xlab("Percent Transcript Coverage") + theme(axis.text.x = element_text(size=10)) +
scale_x_continuous(labels=as.character(per_cov), breaks = per_cov)


grid.arrange(blastx, blastx, ncol=2)
