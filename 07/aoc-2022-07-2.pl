#!/usr/bin/perl
use strict;
use warnings;
use List::Util  qw(sum min);
my $fn = "./input-07.txt";

open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);
my @paths;
my $pwd;
my %pathsize;
my $disksize = 70000000;
my $need     = 30000000;
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

my $totalUsage = $pathsize{'/'};
my $freeSpace = 70000000 - $totalUsage;
my $neededSpace = 30000000;
my $neededFreeSpace = $neededSpace - $freeSpace;
print "Total usage ", $totalUsage, ", free space ", $freeSpace,
      ", need ", $neededFreeSpace, "\n";
my %dirForTotal = reverse %pathsize;
my $minSize = min  min grep { $_ >= $neededSpace } values %pathsize;
print "Should delete $dirForTotal{$minSize} to gain $minSize\n";

