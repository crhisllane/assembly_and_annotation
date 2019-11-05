#!/usr/bin/perl -w

# DESCRIPTION:	VelvetOpt automatizado (Crhisllane Vasconcelos)



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
	mkdir ("FASTQC_afterTrim");
	system ("fastqc output_* -o FASTQC_afterTrim");
	chdir ("..");
}


