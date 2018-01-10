#!/bin/bash

# hmmscan

## Date: 08-01-18

#SBATCH -p highmem
#SBATCH -n 8
#SBATCH --time=2-00:00
#SBATCH --mem=100GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

# loading modules required for Hmmer

 module load HMMER/3.1b2-foss-2016b

PfamDIR=/fast/users/a1654797/Pfam-A.hmm

hmmscan --cpu 8 --domtblout TrinotatePFAM.out $PfamDIR /fast/users/a1654797/Trinity.fasta.transdecoder.pep > pfam.log
