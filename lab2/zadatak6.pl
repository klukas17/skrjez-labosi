#!/usr/bin/perl -w

use open ':locale';
use locale;

$duljina = pop @ARGV;
my %map;
my @rijeci;

while (<>) {
    chomp;
    @rijeci_redak = split / /, $_;
    push @rijeci, @rijeci_redak;
}

foreach (@rijeci) {
    if (/([a-zšđčćž]{$duljina}).*/i) {
        $map{lc $1}++;
    }
}

foreach (sort keys %map) {
    print "$_ : $map{$_}\n";
}