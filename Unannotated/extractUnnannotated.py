import pandas as pd
import numpy as np

annotationreport = "trinotate_report.csv"
dataframe = pd.read_csv(annotationreport)

blastp = (dataframe.sprot_Top_BLASTP_hit == ".")
blastx = (dataframe.sprot_Top_BLASTX_hit == ".")
protein = (dataframe.prot_id == ".")

unannotated = dataframe[blastp & blastx & protein]

unannotated.to_csv('trinotate_unannotated.csv')

# everything above can be ran as a oneliner code 
#pd.read_csv("trinotate_report.csv")[(dataframe.sprot_Top_BLASTP_hit == ".") & (dataframe.sprot_Top_BLASTX_hit == ".") & (dataframe.prot_id == ".")].to_csv('output_unannotated.csv')
#cat unannotated.txt | cut -d ',' -f3 > unannotatedTranscripts.txt
