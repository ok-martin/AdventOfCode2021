use strict;
use warnings;

my $file = 'Day5Input.txt';
open my $info, $file or die "Could not open $file: $!";

my $maxxxxxX = -1073741824;
my $maxxxxxY = -1073741824;

my @pointLines;

# read the file
while(my $line = <$info>)  {
    # extract the points
    my @points = split(' -> ', $line);
    my @pointA = split(',', @points[0]);
    my @pointB = split(',', @points[1]);
    
    my $xx1 = int(@pointA[0]);
    my $xx2 = int(@pointA[1]);
    my $yy1 = int(@pointB[0]);
    my $yy2 = int(@pointB[1]);
    my $minX = $xx1;
    my $maxX = $xx2;
    my $minY = $yy1;
    my $maxY = $yy2;
    
    if ($xx1 > $xx2) {
        $minX = $xx2;
        $maxX = $xx1;
    }
    
    if ($yy1 > $yy2) {
        $minY = $yy2;
        $maxY = $yy1;
    }
    
    if ($maxX > $maxxxxxX) {
        $maxxxxxX = $maxX;
    }
    
    if ($maxY > $maxxxxxY) {
        $maxxxxxY = $maxY;
    }
    
    push(@pointLines, [$xx1, $xx2, $yy1, $yy2, $minY, $maxY]);
}

my @board = ();

foreach my $m (0..$maxxxxxX+1) {
    foreach my $n (0..$maxxxxxY+1) {
        $board[$m][$n] = 0;
    }
}

foreach (@pointLines) {
	my $xx1 = @$_[0];
	my $xx2 = @$_[1];
	my $yy1 = @$_[2];
	my $yy2 = @$_[3];
	my $minX = @$_[4];
	my $maxX = @$_[5];
	my $minY = @$_[6];
	my $maxY = @$_[7];
	
	# straight line
	if ($xx1 == $xx2 or $yy1 == $yy2) {
        for (my $yy = $minY; $yy <= $maxY; $yy++) {
            for (my $xx = $minX; $xx <= $maxX; $xx++) {
                $board[$yy][$xx] = $board[$yy][$xx] + 1; 
            }
	    }
	}
	# diagonal
	else {
		my $yi = $yy1 > $yy2 ? -1 : 1;

		my $yy = $yy1;
		
		if ($xx1 > $xx2) {
    	    for (my $xx = $xx1; $xx >= $xx2; $xx--) {
                $board[$yy][$xx] = $board[$yy][$xx] + 1;
                $yy = $yy + $yi;
		    }
		}
		else {
		   for (my $xx = $xx1; $xx <= $xx2; $xx++) {
                $board[$yy][$xx] = $board[$yy][$xx] + 1;
                $yy = $yy + $yi;
		    }
		}
	}
}

my $count = 0;
foreach my $aa (0..$maxxxxxX+1) {
    foreach my $bb (0..$maxxxxxY+1) {
		if ($board[$aa][$bb] > 1) {
			$count += 1;
		}
    }
}

print($count); # 20898

close $info;
