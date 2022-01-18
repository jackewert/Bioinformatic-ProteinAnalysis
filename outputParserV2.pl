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
@protein1;
@protein2;
@eValue;
@length;
@bitScore;
@name;
#sequid, sseqid, evalue length bitscore stitle
while ($line=<IN>)
{
	chomp($line);
	my @parts= split ' ', $line;
	push @protein1, $parts[0];
	push @protein2, $parts[1];
	push @eValue, $parts[2];
	push @length, $parts[3];
	push @bitScore, $parts[4];
	my $count=0;
	my $name00="";
	foreach $component(@parts){
	if($count>4){
		$name00=$name00 . $component;
		$name00=$name00 . " ";
	}
	$count++	
	}
	push @name, $name00;
	
}	

close FILE;

my $count=0;
$word="ref";
$replace= "}}";
$line=~s/$word/$replace/;
	foreach my $index (@protein2){
		$index=~s/$word/$replace/;
		@temp=split "}}", $index;
		$count++;
	  $index=$temp[1];

	}
	
my $count=0;
$word="WP_";
$replace= "}}";
$line=~s/$word/$replace/;
$currenttemp;
@cprotein1;
	foreach my $index (@protein1){
		$currenttemp=$index;
		$currenttemp=~s/$word/$replace/;
		@temp=split "}}", $currenttemp;
		$count++;
		push @cprotein1, $temp[1];
	}
	
		foreach my $index (@cprotein1){
		$index= substr $index,-4;
	}
	
	foreach my $index (@eValue){
		$index= substr $index,-3;
	}





@idealIndexes;
$currentProtein=$cprotein1[0];
$i=0;
$a=-1;
$flag=0;
$largestIndex=0;
$evaluetemp=0;
foreach my $thing (@protein1){
	if ($cprotein1[$i]!=$cprotein1[$a]){#currentproteinchanged
	#	print"$i  changed\n";
	print "$i BALOOGA\n";
	$idealnum=$largestIndex-1;
	push @idealIndexes, $idealnum;
	$largestIndex=$i;
	}
	else{#currentprotein hasn't changed
    if($bitScore[$i] >= $bitScore[$largestIndex] && $i > $largestIndex){
		$largestIndex=$i;    
    }
	}
$i++;
$a++;
}

#$currentspot=0;
#foreach my $thing (@eValue){
#	if ($thing == 0) {
#    # current protein
#		print"$currentspot $thing\n";    
#    }
#    $currentspot++;
#    }



#foreach my $thing (@protein1){
#	if ($currentProtein == $cprotein1[$i]) {
    # current protein
#    if($bitScore[$i]>$bitScore[$largestIndex]){
#		$largestIndex=$i;    
#    }
	    
#} else {
#    # next protein
#    	print "a $protein1[$largestIndex] ";
#		print "b $protein2[$largestIndex] ";
#    	print "bad\n";
#    $currentProtein=$cprotein1[$i];
#    push @idealIndexes, $largestIndex;
#    #while($bitScore[$i]>99){
	#	$i++;    
   # }
#    my $largestIndex=$i;
#}
#$i++;
#}

	foreach my $index (@idealIndexes){
		print "$index ";
		print "a $protein1[$index] ";
		print "b $protein2[$index] ";
		print "c $bitScore[$index] ";
		print "d $eValue[$index] ";
		print "      $name[$index]\n";
	}



#perl outputParserV2.pl Output1.txt






