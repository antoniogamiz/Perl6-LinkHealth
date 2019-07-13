use v6;
use Perl6::LinkHealth;

package Perl6::LinkHealth::CLI {

    sub RUN-MAIN(|c) is export {
        my %*SUB-MAIN-OPTS = :named-anywhere;
        CORE::<&RUN-MAIN>(|c)
    }

    proto MAIN(|) is export { * }

    #| Start the documentation generation with the specified options
    multi MAIN (
        :$dir,                                                  #= Directory containing the HTML files
        :previous-links($pl) = %?RESOURCES<previous-links.txt>, #= File containing the links to compare
    ) {
        say "Getting links from ./doc/doc";
        my @links = list-directory($doc-dir);

        say "Reading previous links from " ~ $path;
        my @previous-links = read-from-file($path) if $path.IO.e;
        
        say "Comparing links...";
        my @result = compare(@previous-links, @links);

        # say "Writing results to...";
        # save-to-file($save-to, @links.join: "\n");

        pretty-print(@result[0].elems ~ " missing and " ~ @result[1].elems ~ " new.");
    }
}  

sub pretty-print($msg) {
    say "\e[1;36m $msg \e[0m";
}