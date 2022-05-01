#!/usr/bin/perl -w

print "Niz: ";
chomp($niz = <STDIN>);
print "Broj ponavljanja: ";
chomp($ponavljanja = <STDIN>);

for ($count = 0; $count < $ponavljanja; $count++) {
    print "$niz\n";
}