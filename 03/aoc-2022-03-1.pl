#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input-03.txt";

open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);
my $score;
foreach my $s (@lines) {
    my $l  = length($s);
    my $ls = substr $s, 0, $l / 2;
    my $rs = substr $s, $l / 2;
    for my $i ( 0 .. length($ls) - 1 ) {
        my $ch = substr( $ls, $i, 1 );
        if ( $rs =~ /$ch/ ) {
            if ( $ch =~ /[A-Z]/ ) {
                my $j = ord($ch) - ord('A') + 27;
                $score += $j;
                last;
            }
            elsif ( $ch =~ /[a-z]/ ) {
                my $j = ord($ch) - ord('a') + 1;
                $score += $j;
                last;
            }
        }
    }
}

print "score is: " . $score . "\n";
