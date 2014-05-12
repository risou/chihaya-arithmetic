#!/usr/bin/env perl

use strict;
use warnings;

my @op = ('+', '-', '*', '/');

my $counter = 0;
my $chihaya_cnt = 0;

for (my $number = 0; $number < 10000; $number++) {
    my @digits = split //, sprintf("%04d", $number);
    my $chihaya = 0;
    for (my $i = 0; $i < 4; $i++) {
        my $ex0 = $digits[0] . $op[$i];
        for (my $j = 0; $j < 4; $j++) {
            my $ex1 = $ex0 . $digits[1] . $op[$j];
            for (my $k = 0; $k < 4; $k++) {
                my $ex2 = $ex1 . $digits[2] . $op[$k] . $digits[3];
                my $answer = eval $ex2;
                if ($answer) {
                    if ($answer == 72) {
                        print "$ex2 = $answer chihaya found!\n";
                        $counter ++;
                        $chihaya = 1;
                    }
                }
            }
        }
    }
    $chihaya_cnt++ if $chihaya;
}

print "$counter chihaya s found!\n";
print "$chihaya_cnt chihaya digits found!\n";
