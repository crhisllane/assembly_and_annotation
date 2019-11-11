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

open(OUT,"countContig_$lista\.tab");

foreach my $linelist (@lineslist){
	$linelist=~m/\t/;
	my $forward = $`;
	$linelist=~m/\t/;
	my $reverse= $';
	#print "forward:$forward\treverse:$reverse\n";
    chdir ("Dir_$forward\_AND_$reverse");
    my @velvetDir = glob "velt_opt_ALL_data_*";
    chdir ("$velvetDir[0]");
	my $contigs = `grep '>' contigs.fa | wc -l`;
    print OUT ("$forward\_AND_$reverse\t$contigs\n");
	system("assembly-stats contigs.fa > assembly-stats.log");
    chdir ("..");
    chdir ("..");
}

close OUT;