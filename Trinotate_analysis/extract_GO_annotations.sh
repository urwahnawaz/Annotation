#!/bin/bash 


#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=2-00:00
#SBATCH --mem=55GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load R/3.4.2-foss-2016b
module load Perl/5.24.0-foss-2017a
module load SQLite/3.9.2-intel-2015c


DIR=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database

 ${TRINOTATE_HOME}/util/extract_GO_assignments_from_Trinotate_xls.pl \
                         --Trinotate_xls ${DIR}/trinotate_annotation_report.xls \
                         -G --include_ancestral_terms --trans \
                         > go_annotations_transcript.txt
