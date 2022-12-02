#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input-02.txt";

open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);
my $score;
my %column_0 = qw( A ROCK B PAPER C SCISSORS);
my %column_1 = qw( X ROCK Y PAPER Z SCISSORS);
foreach my $s (@lines) {
    my @a = split( ' ', $s );
    if ( $column_0{ $a[0] } eq "ROCK" ) {
        if ( $column_1{ $a[1] } =~ m/ROCK/ )     { $score += 4 }
        if ( $column_1{ $a[1] } =~ m/PAPER/ )    { $score += 8 }
        if ( $column_1{ $a[1] } =~ m/SCISSORS/ ) { $score += 3 }
    }
    elsif ( $column_0{ $a[0] } eq "PAPER" ) {
        if ( $column_1{ $a[1] } =~ m/ROCK/ )     { $score += 1 }
        if ( $column_1{ $a[1] } =~ m/PAPER/ )    { $score += 5 }
        if ( $column_1{ $a[1] } =~ m/SCISSORS/ ) { $score += 9 }
    }
    elsif ( $column_0{ $a[0] } eq "SCISSORS" ) {
        if ( $column_1{ $a[1] } =~ m/ROCK/ )     { $score += 7 }
        if ( $column_1{ $a[1] } =~ m/PAPER/ )    { $score += 2 }
        if ( $column_1{ $a[1] } =~ m/SCISSORS/ ) { $score += 6 }
    }
}
print "total score: " . $score . "\n";
