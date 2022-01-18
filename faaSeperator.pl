# Note that this code is only given as a guide - there are several errors introduced into it - some even on purpose:-) - but you are responsible for making CORRECT (meaning: WORKING) code when you turn in your assignment.

#use diagnostics; # stronger form than 'warnings'

$filename=shift@ARGV;
open(IN,"<".$filename) or die "Error-cannot open input file $filename!\n";
$maximum=0;
$finalseqname=bla;
#Note: the open file option via cmd did not work on the perl on my laptop.
#Note: the open(FILE, "filename"); however did work. 
$filenumber=1;
$x=0;
my $outfile="files$filenumber.txt";
open(FILE01, ">> $outfile") || die "problem opening $outfile\n";
while ($line=<IN>)
{

	chomp($line);
	$currentSeq=$line ."\n";
	if(substr($line,0,1)eq">"){	
		$x++;
	}
	if($x>10){
	close(FILE01);
	$filenumber++;
	$x=1;
	my $outfile="files$filenumber.txt";
	open(FILE01, ">> $outfile") || die "problem opening $outfile\n";
	}
	print FILE01 $currentSeq;
}	
close FILE;
close(FILE01);





#perl faaSeperator.pl GCF_000027325.1_ASM2732v1_protein.faa