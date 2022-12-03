#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input-03.txt";

open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);
my $i     = 0;
my $score = 0;
while ( $i < $#lines ) {
    my $s1 = $lines[$i];
    my $s2 = $lines[ $i + 1 ];
    my $s3 = $lines[ $i + 2 ];
    my @lc = ( 1 .. 26 );
    for my $ch (@lc) {
        my $s = chr( $ch + ord('a') - 1 );
        if ( ( $s1 =~ /$s/ ) and ( $s2 =~ /$s/ ) and ( $s3 =~ /$s/ ) ) {
          $score += $ch;
	}
        my $t = chr( $ch + ord('A') - 1 );
       
        if ( ( $s1 =~ /$t/ ) and ( $s2 =~ /$t/ ) and ( $s3 =~ /$t/ ) ) {
           $score += $ch + 26;
       	}

    }
    $i += 3;
}

print "score is: " . $score . "\n";
