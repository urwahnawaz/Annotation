#!/bin/bash


#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=01:00:00
#SBATCH --mem=45GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au



module load Trinity/2.5.1-foss-2016b
module load Python/2.7.13-foss-2016b


DIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir
Annotdir=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database
ExprDIR=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix

/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/util/misc/TPM_weighted_gene_length.py  \
         --gene_trans_map $DIR/Trinity.fasta.gene_trans_map \
         --trans_lengths $Annotdir/trinity_length/Trinity.fasta.seq_lens \
         --TPM_matrix $ExprDIR/Trinity.isoform.TMM.EXPR.matrix > Trinity.gene_lengths.txt
