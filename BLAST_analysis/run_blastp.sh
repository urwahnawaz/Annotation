#!/bin/bash

#SBATCH -p batch
#SBATCH -n 16
#SBATCH --time=3-00:00
#SBATCH --mem=100GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au



module load Trinity/2.5.1-foss-2016b
module load BLAST+/2.6.0-foss-2016b-Python-2.7.13

DatabaseDIR=//fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/database/uniprot_DB
TransDecoderDIR=//fast/users/a1654797/Second_try/Annotation/second_assembly



blastp -query ${TransDecoderDIR}/Trinity.fasta.transdecoder.pep -db $DatabaseDIR/uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -evalue 1e-5 -outfmt 6 > sp_all_blastp.outfmt6
