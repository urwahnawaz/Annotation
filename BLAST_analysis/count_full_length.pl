#!/usr/bin/perl
use strict; use warnings; use File::Basename;


############################################################################################
### ###
### This script will count full-length transcripts
###########################################################################################

###paths ###

my $home_dir = "/fast/users/a1654797";
my $wd = ".";
my $db = $home_dir . "/Second_try/Trinotate_annotation/second_annotation/database/uniprot_sprot.pep" ;
my $assembly = $home_dir . "/Second_try/Trinity_assembly/Trimming_withTGtry1/trinity_out_dir/Trinity.fasta" ;
my $transD_pep = $home_dir . "/Second_try/Annotation/second_assembly/Trinity.fasta.transdecoder.pep" ;

# Program paths - may need changing if versions or install locations change #
my $trinity_dir = "/apps/software/Trinity/2.5.1-foss-2016b/trinityrnaseq-Trinity-v2.5.1"; # phoenix install

my $group_blast = $trinity_dir . "/util/misc/blast_outfmt6_group_segments.pl";
my $blast_coverage = $trinity_dir . "/util/misc/blast_outfmt6_group_segments.tophit_coverage.pl";


############################################################################################
### Full-length transcript analysis ###
############################################################################################
### Group BLAST hits to improve coverage ###

print "Grouping BLAST hits to improve coverage: "; system("date");
print "Grouping BLASTX with SWISS-PROT database";
system("$group_blast $wd/sp_all_blastx.outfmt6 $assembly $db > $wd/sprot.blastx.out.grouped");

print "Grouping BLASTP with SWISS-PROT database";
system("$group_blast $wd/sp_all_blastp.outfmt6 $transD_pep $db > $wd/sprot.blastp.out.grouped");
print("Finished: "); system("date");

### Full-length transcript analysis ###
print "Analyzing full-length transcripts: "; system("date");
print "Running full-length transcript analysis on BLASTX with SWISS-PROT database";
system("$blast_coverage $wd/sprot.blastx.out.grouped > $wd/full_length_transcripts_blastx_sprot.tab");
print "Running full-length transcript analysis on BLASTP with SWISS-PROT database";
system("$blast_coverage $wd/sprot.blastp.out.grouped > $wd/full_length_transcripts_blastp_sprot.tab");


print("Finished: "); system("date");
