#!/usr/bin/env perl 

use v5.14;
use strict;
use warnings;

use HiPi::BCM2835;
use HiPi::Constant qw( :raspberry );

my $bcm = HiPi::BCM2835->new();
my $pin = $bcm->get_pin( RPI_PAD1_PIN_11 );
my $mode = $pin->mode();

if ( $mode & RPI_PINMODE_OUTP ) {
    $pin->value(1);
} elsif( $mode & RPI_PINMODE_INPT ) {
    say q(Current pin Value is :) . $pin->value();

    $pin->interrupt( RPI_INT_RISE );
}
