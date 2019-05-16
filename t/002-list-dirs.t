use v6;
use Test;

plan 1;

use Perl6::LinkHealth;

my $expected = "assets/testing-dirs/a.txt assets/testing-dirs/b/b.txt";

is list-directory("assets/testing-dirs"), $expected, "Basic dir list";