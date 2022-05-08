#!/usr/bin/perl -w

# pokretanje: ./zadatak3.pl localhost_access_log.2008-02-24.txt localhost_access_log.2008-02-25.txt

foreach (@ARGV) {
    open LOGS, "<", $_;
    if (/[a-zA-Z_]*\.([0-9]*-[0-9]*-[0-9]*)\.txt/) {
        $datum = $1;
        my %mapa;
        for ($i = 0; $i < 24; $i++) {
            if ($i < 10) {
                $mapa{"0$i"} = 0;
            }
            else {
                $mapa{$i} = 0;
            }
        }
        while (defined($_ = <LOGS>)) {
            if (/[^[]*\[[0-9]*\/[a-zA-z]*\/[0-9]*:([0-9]*).*/) {
                $mapa{$1}++;
            }
        }
        print "Datum: $datum\n";
        print "sat : broj pristupa\n";
        print "-------------------------------\n";
        foreach $sat (sort {$a <=> $b} keys %mapa) {
            printf "  %s : %d\n", $sat, $mapa{$sat};
        }
        print "\n";
    }
    close LOGS;
}