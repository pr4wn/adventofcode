#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input.txt";

open my $fh, '<', $fn or die $!;
chomp (my @lines = <$fh>);
close($fh);
my @elves = 0;
my $s;
my $elfno = 0;
my $maxelfno = 0;
my $maxelf = 0;
my @totals;

foreach my $s (@lines) {
  if ($s eq "") {
	push @totals, $elves[$elfno];
	$s = "";
    	$elfno++;
  } else {
      $elves[$elfno] += $s;
  }
}

@totals = sort { $a <=> $b } @totals;
my @stotals = reverse(@totals);

my $j =  $stotals[0] + $stotals[1] + $stotals[2] ;

print "Top three elves have consumed " . $j . " calories\n";
