use v6;
use Test;

plan 1;

use Perl6::LinkHealth;

my $expected = "/a.txt /b/b.txt";

is list-directory("assets/testing-dirs"), $expected, "Basic dir list";
