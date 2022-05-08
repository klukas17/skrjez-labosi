#!/usr/bin/perl -w

# pokretanje: ./zadatak2.pl

@lista = ();

while (<>) {
    chomp;
    push @lista, $_;
}

$suma = 0;
foreach (@lista) {
    $suma += $_;
}

print "Prosjek učitanih elemenata: " . $suma / (scalar @lista) . "\n";