#!/usr/bin/env perl

use strict;
use warnings;

my @op = ('+', '-', '*', '/');

while (defined(my $input = <STDIN>)) {
    chomp($input);

    last if $input eq '';

    if (length($input) != 4) {
        print "input is not 4 digits.\n";
        next;
    }

    my @digits = split(//, $input);

    my $chihaya = 0;
    for (my $i = 0; $i < 4; $i++) {
        my $ex0 = $digits[0] . $op[$i];
        for (my $j = 0; $j < 4; $j++) {
            my $ex1 = $ex0 . $digits[1] . $op[$j];
            for (my $k = 0; $k < 4; $k++) {
                my $ex2 = $ex1 . $digits[2] . $op[$k] . $digits[3];
                my $answer = eval $ex2;
                if ($answer) {
                    next if $answer =~ /\./;
                    if ($answer == 72) {
                        print "$ex2 = $answer chihaya found!\n";
                        $chihaya = 1;
                    }
                }
            }
        }
    }
    if (!$chihaya) {
        print "not chihaya.\n";
    }
}
