# assembly_and_annotation
assembly_and_annotation/

*scripts para automatizar o processo de montagem e anotação de genomas paired*

## Dependências
- FastQC (http://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- Trimmomatic (http://www.usadellab.org/cms/?page=trimmomatic)
- VelvetOptimiser (https://github.com/tseemann/VelvetOptimiser)
- Prokka (https://github.com/tseemann/prokka)

## Rodando automatizado
neste modo um unico comando é necessário, onde será realizado a análise da qualidade do sequenciamento, a trimagem, a análise da trimagem, a montagem, a contagem de contigs e a anotação


<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

    $ AssemblyAnnot.pl files.tab dir_dos_scripts  

<!--endsec-->

- files.tab é um arquivo tabular onde a primeira coluna contém a read1 e a segunda coluna contém a read2
- dir_dos_scripts  o caminho completo para os scrits disponíveis aqui

## Rodando um a um
O primeiro passo necessário é o de análise do sequenciamento com fastaqc
dessa forma é necessário rodar inicialmente:

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

    $ first_fastqc.pl files.tab
    
<!--endsec-->

- first_fastqc.pl cria os diretrios necessários para todos os scripts e roda o fastqc para todas as sequencias
- files.tab é um arquivo tabular onde a primeira coluna contém a read1 e a segunda coluna contém a read2


Após rodar o first_fastqc.pl, qualquer um dos demais outros scripts podem ser utilizados junto com o arquivo files.tab

## lista de scripts:
- trimmo_automatic.pl (trima as sequencias por qualidade)
- fastq_direc.pl (roda o fastqc para sequencias trimadas)
- velvetOp_automatic.pl (roda a montagem com o velvetOptimiser)
- count_contig.pl (realiza a contagem dos contigs)
- prokka_automatic.pl (realiza a anotação com o prokka)
