#!/usr/bin/perl -w

# DESCRIPTION:	VelvetOpt automatizado (Crhisllane Vasconcelos)



my $usage="\nCommand Line:\n$0 [lista de arquivos] [caminho para o diretorio dos scripts]\n\n"; 

my $lista = $ARGV[0] || die "$usage";
my $dir = $ARGV[1]|| die "$usage";

package run {
    sub script {
        my ($n1) = @_;
        system ("perl $n1 $lista") ;
    }
}

$dir=~s/\/$//;
#$dir=~s/$/\//;
@scripts = ("first_fastqc.pl", "trimmo_automatic.pl", "fastq_direc.pl", "velvetOp_automatic.pl", "count_contig.pl", "prokka_automatic.pl");

foreach my $script (@scripts){
    run::script("$dir/$script");
}


