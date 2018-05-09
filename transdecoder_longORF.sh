#!/bin/bash

#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=08:00:00
#SBATCH --mem=50GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au



##module load Trinity/2.5.1-foss-2016b
##module load BLAST+/2.6.0-foss-2016b-Python-2.7.13
module load  Perl/5.24.0-foss-2017a


longORF=/fast/users/a1654797/TransDecoder/TransDecoder-TransDecoder-v5.0.2/TransDecoder.LongOrfs
trinity=/fast/users/a1654797/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir/Trinity.fasta

$longORF -t $trinity
