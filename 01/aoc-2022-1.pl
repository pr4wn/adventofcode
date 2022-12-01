#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input.txt";

open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);
my @elves = 0;
my $s;
my $elfno    = 0;
my $maxelfno = 0;
my $maxelf   = 0;

foreach my $s (@lines) {
    if ( $s eq "" ) {
        if ( $maxelfno <= $elves[$elfno] ) {
            $maxelf   = $elfno;
            $maxelfno = $elves[$elfno];
        }
        $s = "";
        $elfno++;
    }
    else {
        $elves[$elfno] += $s;
    }
}

print "Elf number $maxelf has carried " . $maxelfno . " calories\n";
