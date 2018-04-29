#!/bin/bash

#SBATCH -p batch
#SBATCH -n 16
#SBATCH --time=00:30:00
#SBATCH --mem=20GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


module load Trinity/2.5.1-foss-2016b
module load BLAST+/2.6.0-foss-2016b-Python-2.7.13
module load Perl/5.24.0-foss-2017a

#full-length analysis 
#script 
full-length=/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1/util/analyze_blastPlus_topHit_coverage.pl

Database=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/database/Molluscs/mollusc.fasta
Trinity=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database/without_homology/unannotated_transcripts/unannotatedTranscripts.fasta
blast=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database/without_homology/unannotated_transcripts/mollusc_blastx.outfmt6




$full-length $blast $Trinity $Database
