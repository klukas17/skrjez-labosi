#!/usr/bin/perl -w

@lista = ();

while (<>) {
    push @lista, $_;
}

$suma = 0;
foreach (@lista) {
    $suma += $_;
}

print "Prosjek učitanih elemenata: " . $suma / (scalar @lista) . "\n";