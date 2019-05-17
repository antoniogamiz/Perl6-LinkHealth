use v6;

use Perl6::LinkHealth;

sub MAIN($doc-dir, $previous, $save-to) {
    say "Getting links from ./doc/doc";
    my @links = list-directory($doc-dir);

    say "Reading previous links from " ~ $previous;
    my @previous-links = read-from-file($previous) if $previous.IO.e;
    
    say "Comparing links...";
    my @result = compare(@previous-links, @links);

    say "Writing results to...";
    save-to-file($save-to, @links.join: "\n");

    say @result[0].elems ~ " missing and " ~ @result[1].elems ~ " new.";

}