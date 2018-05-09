#!/bin/bash 


#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=05:00:00
#SBATCH --mem=25GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load R/3.4.2-foss-2016b
module load Perl/5.24.0-foss-2017a
module load SQLite/3.9.2-intel-2015c


#loading all the files into the SQLite database 

database=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database
Trinity=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir
peptide=/fast/users/a1654797/Second_try/Annotation/second_assembly
Results=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly

trinotate=/fast/users/a1654797/Trinotate_program/Trinotate-Trinotate-v3.1.1/Trinotate


echo "###########################"
echo Generating report table
echo "###########################"

$trinotate ${database}/Trinotate.sqlite report > trinotate_report.xls
