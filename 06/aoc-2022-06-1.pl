#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input-06.txt";
open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);
foreach my $s (@lines) {
    for my $i ( 0 .. length($s) - 4 ) {
        my $s1        = substr( $s, $i, 4 );
        my %seen      = ();
        my $seencount = 0;
        for my $j ( 0 .. length($s1) - 1 ) {
            my $ch = substr( $s1, $j, 1 );
            if ( !$seen{$ch} ) {
                $seen{$ch} += 1;
                $seencount += 1;
            }
            if ( $seencount == 4 ) {
                my $result = $i + 4;
                print "Result = $result\n";
                exit;
            }
        }
    }
}
