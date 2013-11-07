#!/usr/bin/local/perl
use v5.16;
use Athena::Lib;

use Test::More;
use Score;

require_ok('Score');
ok(Score::CalculateScore('12345123451234512345') == 60);
ok(Score::ThrowType("X") == "STRIKE");
is(Score::ThrowType('5'), 'NORMAL');

	
done_testing();
