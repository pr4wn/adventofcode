#!/usr/bin/perl
use strict;
use warnings;

my $fn = "./input-05.txt";
my @stacks =
  qw(QGPRLCTF JSFRWHQN QMPWHBF FDTSV ZFVWDLQ SLCZ FDVMBZ BJT HPSLGBNQ);

open my $fh, '<', $fn or die $!;
chomp( my @lines = <$fh> );
close($fh);

foreach my $s (@lines) {
    if ( $s =~ /move/ ) {
        my @a = split ' ', $s;
        my $m = $a[1];
        my $f = $a[3];
        my $t = $a[5];
        for ( my $i = 1 ; $i <= $m ; $i++ ) {
            my $ch = substr( $stacks[ $f - 1 ], 0, 1 );
            $stacks[ $t - 1 ] = $ch . $stacks[ $t - 1 ];
            $stacks[ $f - 1 ] =~ s/^.//;

        }
    }
}
foreach my $s (@stacks) {
    print substr( $s, 0, 1 );
}
print "\n";
