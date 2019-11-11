#!/usr/bin/perl -w

# DESCRIPTION:	trimmomatic automatizado (Crhisllane Vasconcelos)



my $usage="\nCommand Line:\n$0 [lista de arquivos]\n\n"; 

my $lista = $ARGV[0] || die "$usage";

open(LISTA,"$lista");

my $line;
my @lineslist;

while($line=<LISTA>){
	chomp($line);
	push(@lineslist,$line)
}
close LISTA;

foreach my $linelist (@lineslist){
	$linelist=~m/\t/;
	my $forward = $`;
	$linelist=~m/\t/;
	my $reverse= $';
	print "forward:$forward\treverse:$reverse\n";
    chdir ("Dir_$forward\_AND_$reverse");
	system ("trimmomatic-0.38.jar PE -phred33 $forward $reverse output_$forward\_paired.fq.gz output_$forward\_unpaired.fq.gz output_$reverse\_paired.fq.gz output_$reverse\_unpaired.fq.gz ILLUMINACLIP:NexteraPE-PE.fa:2:30:10 LEADING:30 AVGQUAL:33 TRAILING:30 SLIDINGWINDOW:4:15 MINLEN:200");
    chdir ("..");
}

