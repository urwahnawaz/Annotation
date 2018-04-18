#!/bin/bash
#Loading gene and transcript expression data on SQLite


#SBATCH -p highmem
#SBATCH -n 16
#SBATCH --time=08:00:00
#SBATCH --mem=155GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load R/3.4.2-foss-2016b
module load Perl/5.24.0-foss-2017a
module load SQLite/3.9.2-intel-2015c

#scripts
import_expression=$TRINOTATE_HOME/util/transcript_expression/import_expression_and_DE_results.pl 
import_cluster=$TRINOTATE_HOME/util/transcript_expression/import_transcript_clusters.pl 

#directories

Database=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database/without_homology/expression/expression_analysis/Trinotate.sqlite
matrix=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/Transcript_quantification/RSEM_analysis/Expression_matrix
samples=$matrix/samples_all.txt
edgeR=$matrix/edgeR

echo " load transcript expression data "
$import_expression --sqlite $Database --transcript_mode --samples_file $samples \
        --count_matrix $matrix/Trinity.isoform.counts.matrix \
        --fpkm_matrix $matrix/Trinity.isoform.TMM.EXPR.matrix \
        --DE_dir $edgeR/edgeR_transcript

echo " load gene expression data "

$import_expression --sqlite $Database --gene_mode --samples_file $samples  \
        --count_matrix $matrix/Trinity.gene.counts.matrix\
        --fpkm_matrix $matrix/Trinity.gene.TMM.EXPR.matrix \
        --DE_dir $edgeR/edgeR_gene


echo "loading cluster data"

$import_cluster --group_name edgeR_DE_analysis \
     --analysis_name $edgeR/edgeR_transcript/diffExpr.P1e-3_C2.matrix.RData.clusters_fixed_P_30 \
     --sqlite $Database $edgeR/edgeR_transcript/diffExpr.P1e-3_C2.matrix.RData.clusters_fixed_P_30/*matrix


echo " loading cluster data"
$import_cluster --group_name edgeR_DE_analysis \
     --analysis_name $edgeR/edgeR_gene/diffExpr.P1e-3_C2.matrix.RData.clusters_fixed_P_30 \
     --sqlite $Database $edgeR/edgeR_gene/diffExpr.P1e-3_C2.matrix.RData.clusters_fixed_P_30/*matrix
