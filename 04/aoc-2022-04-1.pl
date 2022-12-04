#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input-04.txt";

open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);
my $score;
foreach my $s (@lines) {
    my @a  = split( ',', $s );
    my @p1 = split( '-', $a[0] );
    my @p2 = split( '-', $a[1] );
    if (   ( $p1[0] >= $p2[0] && $p1[1] <= $p2[1] )
        || ( $p2[0] >= $p1[0] && $p2[1] <= $p1[1] ) )
    {
        $score++;
    }
}
print "total score: " . $score . "\n";
