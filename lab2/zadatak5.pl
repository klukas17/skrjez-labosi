#!/usr/bin/perl -w

sub custom_sort {
    if ($bodovi{$a} != $bodovi{$b}) {
        return $bodovi{$a} <=> $bodovi{$b};
    }
}

@koeficijenti = ();
$koeficijenti_procitani = 0;
my %mapa;
my (%imena, %prezimena, %bodovi);
my @jmbazi = ();
while (<>) {
    if (/^#.*/) {
        next;
    }
    else {
        chomp;
        if (!$koeficijenti_procitani) {
            $koeficijenti_procitani = 1;
            @koeficijenti = split /;/, $_;
        }
        else {
            if (/([0-9]*);([A-Za-zšđčćžŠĐČĆŽ]*);([A-Za-zšđčćžŠĐČĆŽ]*);(.*)/) {
                $sum = 0;
                @lista = split /;/, $4;
                if (scalar @lista != scalar @koeficijenti) {
                    die "Greška!\n";
                }
                else {
                    for ($i = 0; $i < @koeficijenti; $i++) {
                        if ($lista[$i] ne "-") {
                            $sum += $koeficijenti[$i] * $lista[$i];
                        }
                    }
                    $prezimena{$1} = $2;
                    $imena{$1} = $3;
                    $bodovi{$1} = $sum;
                    push @jmbazi, $1;
                }
            }
        }
    }
}

@sortirani_jmbazi = sort {
    -($bodovi{$a} <=> $bodovi{$b}) or
    ($prezimena{$a} cmp $prezimena{$b}) or
    ($imena{$a} cmp $imena{$b}) or
    ($a cmp $b)
} @jmbazi;

$max = 0;
my %zapisi;
foreach (@jmbazi) {
    $zapisi{$_} = "$prezimena{$_}, $imena{$_} ($_)";
    $l = length($zapisi{$_});
    if ($max < $l) {
        $max = $l;
    }
}

$max += 3;

print "Lista po rangu:\n-------------------\n";
for ($i = 0; $i < @sortirani_jmbazi; $i++) {
    $j = $sortirani_jmbazi[$i];
    $num = $i + 1;
    $praznine = " " x ($max - length($zapisi{$j}));
    print "  $num. $zapisi{$j}$praznine: $bodovi{$j}\n";
}