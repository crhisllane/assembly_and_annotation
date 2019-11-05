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
    #mkdir ("Dir_$forward\_AND_$reverse");
    chdir ("Dir_$forward\_AND_$reverse");
    #system ("cp ../*$forward* .");
    #system ("cp ../*$reverse* .");
    system ("velvetoptimiser -s 81 -e 190 -x 10 -o '-min_contig_lgth 200' -f '-fastq -shortPaired2 output_$forward\_paired.fq.gz output_$reverse\_paired.fq.gz -short output_$forward\_unpaired.fq.gz -short output_$reverse\_unpaired.fq.gz' -p velt_opt_ALL  -t 2 -optFuncKmer=n50");
    chdir ("..");
}

