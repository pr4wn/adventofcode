#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input-07.txt";

open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);
my @paths;
my $pwd;
my %pathsize;
my $maxsize = 100000;

foreach my $s (@lines) {
    if ( $s =~ /^\$ cd \// ) {
        push @paths, "/";
        $pwd = "/";
    }
    elsif ( $s =~ /^\$ cd \.\./ ) {
        pop @paths;
        $pwd = $paths[$#paths];
    }
    elsif ( $s =~ /^\$\ cd\ / ) {
        my @a = split ' ', $s;
        $pwd = "$pwd/$a[2]";
        push @paths, $pwd;
    }
    elsif ( $s =~ /^dir\ / ) {
        my @a = split ' ', $s;
        $pathsize{ $a[1] } += 0;
    }
    elsif ( $s =~ /ls/ ) {

        #ignore
    }
    elsif ( $s =~ /^\d/ ) {
        my @a = split ' ', $s;
        foreach my $dir (@paths) {
            $pathsize{$dir} += $a[0];
        }
    }

}

my $totals;

foreach my $key ( keys %pathsize ) {
    if ( $pathsize{$key} <= 100000 ) {
        $totals += $pathsize{$key};
    }
}

print "Total: $totals\n";

