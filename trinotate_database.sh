#!/bin/bash

#SBATCH -p batch
#SBATCH -n 12
#SBATCH --time=04:00:00
#SBATCH --mem=100GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au



module load Perl/5.24.0-foss-2017a


$TRINOTATE_HOME/admin/Build_Trinotate_Boilerplate_SQLite_db.pl  Trinotate
