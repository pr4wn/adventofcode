#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input-06.txt";
open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);
my %seen;
my $seencount;
foreach my $s (@lines) {
    for my $i ( 0 .. length($s) - 14 ) {
        my $s1 = substr( $s, $i, 14 );
        %seen      = ();
        $seencount = 0;
        for my $j ( 0 .. length($s1) ) {
            my $ch = substr( $s1, $j, 1 );
            if ( !$seen{$ch} ) {
                $seen{$ch} += 1;
                $seencount += 1;
            }
            if ( $seencount == 15 ) {
                my $result = $i + 14;
                print "Result = $result\n";
                exit;
            }
        }
    }
}

