#!/usr/bin/perl -w

# DESCRIPTION:	VelvetOpt automatizado (Crhisllane Vasconcelos)



my $usage="\nCommand Line:\n$0 [lista de arquivos] [diretorio dos arquivos fastq]\n\n"; 

my $lista = $ARGV[0] || die "$usage";
my $dirF = $ARGV[1] || die "$usage";

open(LISTA,"$lista");

my $line;
my @lineslist;

while($line=<LISTA>){
	chomp($line);
	push(@lineslist,$line)
}
close LISTA;

$dirF=~s/\/$//;

foreach my $linelist (@lineslist){
	$linelist=~m/\t/;
	my $forward = $`;
	$linelist=~m/\t/;
	my $reverse= $';
	print "forward:$forward\treverse:$reverse\n";
   	mkdir ("Dir_$forward\_AND_$reverse");
	chdir ("Dir_$forward\_AND_$reverse");
    system ("ln -s $dirF/$forward $forward");
    system ("ln -s $dirF/$reverse $reverse");
	mkdir ("FASTQC_beforeTrim");
	system ("fastqc $forward -o FASTQC_beforeTrim");
	system ("fastqc $reverse -o FASTQC_beforeTrim");
	chdir ("..");
}


