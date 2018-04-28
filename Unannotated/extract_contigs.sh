#!/bin/bash 

#SBATCH -p batch
#SBATCH -n 16
#SBATCH --time=02:00:00
#SBATCH --mem=30GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load Perl/5.24.0-foss-2017a
module load bioperl/1.6.924
assembly=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir/Trinity.fasta
outDIR=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database/without_homology/unannotated_transcripts
unannotated_names=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/all_assembly/loading_into_database/without_homology/unannotatedTranscripts.txt

if [ -d outDIR]; then
	echo "$outDIR exists"
else 
	mkdir $outDIR
fi

perl ExtractContigs.pl $assembly $outDIR/unannotatedTranscripts.fasta $unannotated_names --isoforms
