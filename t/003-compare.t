use v6;
use Test;

plan 4;

use Perl6::LinkHealth;

{
    is compare([], ["a"]), ([], ["a"]), "First argument empty";
    is compare(["a"], []), (["a"], []), "Second argument empty";
    is compare([], []), ([], []), "Both arguments empty";
    is compare(["a", "b"], ["c"]), (["a", "b"], ["c"]), "General case";
}
