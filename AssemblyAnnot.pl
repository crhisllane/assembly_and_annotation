#!/usr/bin/perl -w

# DESCRIPTION:	VelvetOpt automatizado (Crhisllane Vasconcelos)



my $usage="\nCommand Line:\n$0 [lista de arquivos] [caminho completo para o diretorio dos scripts] [caminho completo para o diretorio dos fastq]\n\n"; 

my $lista = $ARGV[0] || die "$usage";
my $dir = $ARGV[1]|| die "$usage";
my $dirF = $ARGV[2]|| die "$usage";


package run {
    sub script {
        my ($n1) = @_;
        system ("perl $n1 $lista") ;
    }
}

$dirF=~s/\/$//;
$dir=~s/\/$//;

@scripts = ("trimmo_automatic.pl", "fastq_direc.pl", "velvetOp_automatic.pl", "count_contig.pl", "prokka_automatic.pl");

system ("$dir/first_fastqc.pl $lista $dirF");
foreach my $script (@scripts){
    run::script("$dir/$script");
}


