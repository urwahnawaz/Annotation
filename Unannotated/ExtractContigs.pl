#!/usr/bin/perl
use warnings; use Bio::SeqIO;
############################################################################################################
### ###
### Extract contigs (genes/isoforms) as specified by a file listing their headers ###
### ###
### Arguments: ###
### ###
### 1. Full Assembly File (e.g. "Trinity.fasta") ###
### 2. Output File (e.g. "Subset.fasta") ###
### 3. File listing the Trinity-formatted headers for the contigs of interest ###
### 4. "--genes" OR "--isoforms" mode (this is necessary to specify to avoid erroneous matches) ###
### ###
### Current Trinity format used (YOU WILL NEED TO MODIFY THE SCRIPT IF THIS CHANGES): ###
### ###
### GENES FORMAT: TRINITY_DN21111_c0_g1 ###
### ISOFORMS FORMAT: TRINITY_DN21111_c0_g1_i1 ###
### ###
### Note: The "CONTIG-FILE" must be a single header (for the contig to be extracted) per line ###
### ###
############################################################################################################
### Check usage and get arguments ###
unless(@ARGV == 4){
die("Usage: ExtractContigs.pl <ASSEMBLY> <OUT-FILE> <CONTIG-FILE> <--genes OR --isoforms>\n")
}
my $assembly = $ARGV[0];
my $outfile = $ARGV[1];
my $contig_file = $ARGV[2];
my $mode = $ARGV[3];

unless(($mode eq "--genes") || ($mode eq "--isoforms")){
die("Error: Mode \"$mode\" is not understood - please use \"--genes\" or \"--isoforms\"\n")
}
### Open the requested contigs file and save the headers as a hash ###
my %requests;
open(REQUESTS, "<$contig_file");
while(<REQUESTS>){
my $request = $_;
chomp($request);
$request =~ s/^>//;
$request =~ s/\s+$//;
# Use magic to make sure the header will match only the single gene/isoform in question #
if($mode eq "--genes"){
if($request =~ /(TRINITY_DN\d+_c\d+_g\d+)$/){
$request =~ s/$/_/;
}
else{die("Error: In \"--genes\" mode the request must end with the gene number!\n")}
}
elsif($mode eq "--isoforms"){
if($request =~ /(TRINITY_DN\d+_c\d+_g\d+_i\d+)$/){
$request =~ s/$/_/;
}
else{die("Error: In \"--isoforms\" mode the request must end with the isoform number!\n")}
}
else{die("Error: Mode $mode is not understood!\n")}
# Load it into the hash for reference later #
$requests{$request} = 1;
}
close(REQUESTS);

### Take in each sequence and print it out if it is present in the requested contigs file ###
$seq_in = Bio::SeqIO->new(-file => "<$assembly", -format => "fasta");
$seq_out = Bio::SeqIO->new(-file => ">$outfile", -format => "fasta");
while($contig = $seq_in->next_seq){
# Identify ID and magically modify it for the appropriate mode #
my $cseq = $contig->display_id;
chomp($cseq);

$cseq =~ s/^>//;
$cseq =~ s/\s+$//;
if($mode eq "--genes"){
$cseq =~ s/(TRINITY_DN\d+_c\d+_g\d+_)i\d+/$1/;
}
elsif($mode eq "--isoforms"){
$cseq =~ s/$/_/;
}
else{die("Error: Mode $mode is not understood!\n")}
# Print it out if it is present in the contig requests file #
if(exists($requests{$cseq})){
$seq_out->write_seq($contig);
}
}
