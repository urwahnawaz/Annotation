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


#loading all the files into the SQLite database 

#scripts 

load_data=/fast/users/a1654797/Trinotate_program/Trinotate-Trinotate-v3.1.1/Trinotate 

#my directories
database=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database/Trinotate.sqlite
Trinity=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir
peptide=/fast/users/a1654797/Second_try/Annotation/second_assembly
annotation=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly


#### LOADING BLAST REULTS
echo "loading results from BLAST searches"

$load_data LOAD_swissprot_blastp $database $annotation/BLAST_just_uniprotsp/sp_all_blastp.outfmt6

$load_data LOAD_swissprot_blastx $database $annotation/BLAST_just_uniprotsp/sp_all_blastx.outfmt6

#### LOADING PFAM RESULTS

echo " Loading results from HMMER search"
$load_data $database LOAD_pfam $annotation/TrinotatePFAM.out

### LOADING TmHMM results
echo " Loading TmHMM results"

$load_data $database LOAD_tmhmm $annotation/tmhmm.out

#### LOADING SignalP results 

echo "loading signalp results "
$load_data $database LOAD_signalp $annotation/signalp.out
