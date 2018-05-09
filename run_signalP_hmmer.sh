#!/bin/bash


#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=3-00:00
#SBATCH --mem=120GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au


module load  Perl/5.24.0-foss-2017a
module load HMMER/3.1b2-foss-2016uofa


#scripts
signalP=/fast/users/a1654797/packages_for_annotation/signalp-4.1/signalp

#directories to databases
PfamDIR=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/database/Pfam

#record files
record=/fast/users/a1654797/Second_try/Trinotate_annotation/second_annotation/record/recording_annotations.txt
recordDIR=/fast/users/a1654797/Trinotate_annotation/second_annotation/record/

if [ -d ${recordDIR} ]; then
	echo " ${recordDIR} exists"
else 
	mkdir ${recordDIR}
	echo " ${recordDIR} didn't exist, now does"
fi

if [ -f ${record} ]; then
	rm ${record}
	touch ${record}
    echo "${record} exists, replacing" >> ${record} 2>&1
else
    touch ${record}
    echo "${record} did not exist, now does" >> ${record} 2>&1
fi

#direcoties to transdecoder.pep files 

TransdecoderDIR=/fast/users/a1654797/Second_try/Annotation/second_assembly

echo "commening signalp search for all sequecnes" >> ${record} 2>&1
$signalP -f short -n signalp.out ${TransdecoderDIR}/Trinity.fasta.transdecoder.pep

echo "commening pfam search for all sequences" >> ${record} 2>&1

hmmscan --cpu 12 --domtblout TrinotatePFAM.out \
          ${PfamDIR}/Pfam-A.hmm \
          ${TransdecoderDIR}/Trinity.fasta.transdecoder.pep



