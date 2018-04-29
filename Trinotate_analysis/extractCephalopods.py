import pandas as pd
import numpy as np

annotationreport = "trinotate_report.csv"
#dataframe = pd.read_csv(annotationreport)

#blastp = (dataframe.sprot_Top_BLASTP_hit == "Mollusca")
#blastx = (dataframe.sprot_Top_BLASTX_hit == "Mollusca")


#if "Mollusca" in dataframe['sprot_Top_BLASTX_hit']:
filedf = open(annotationreport,'r')

write_file = "mollusc_annotations.csv"
with open(write_file, "w") as output:
    for row in filedf:
        if "Mollusca" in row:
            output.write(row + '\n')


molluscreport= "mollusc_annotations.csv"

#molluscdf = rd.read_csv(molluscreport)

molluscdf = open(molluscreport,'r')

write_file = "cephalopod_annotations.csv"
with open(write_file, "w") as output:
    for row in molluscdf:
        if "Cephalopoda" in row:
            output.write(row + '\n')
