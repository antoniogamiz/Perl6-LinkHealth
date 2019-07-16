use v6;
use Perl6::LinkHealth;

package Perl6::LinkHealth::CLI {

    sub RUN-MAIN(|c) is export {
        my %*SUB-MAIN-OPTS = :named-anywhere;
        CORE::<&RUN-MAIN>(|c)
    }

    proto MAIN(|) is export { * }

    #| Compare the current links with the given links file
    multi MAIN (
        :$html-dir!,                                            #= Directory containing the HTML files
        :previous-links($pl) = %?RESOURCES<previous-links.txt>, #= File containing the links to compare
    ) {
        say "Getting links from ./doc/doc";
        my @links;
        for <programs language routine type programs syntax> -> $d {
            @links.append: list-directory($html-dir ~ "/$d").map({$d~$_}).Slip;
        }

        say "Reading previous links...";
        my @previous-links = read-from-file($pl) if $pl.IO.e;
        
        say "Comparing links...";
        my @result = compare(@previous-links, @links);

        # say "Writing results to...";
        # save-to-file($save-to, @links.join: "\n");

        pretty-print(@result[0].elems ~ " missing and " ~ @result[1].elems ~ " new.");
        if (@result[0].elems > 0) {exit 1;}
    }

    multi MAIN (
        'write',
        :$html-dir!,
        :$to          #= File where the links will be written
    ) {
        say "Getting links from $html-dir";
        my @links;
        for <programs language routine type programs syntax> -> $d {
            @links.append: list-directory($html-dir ~ "/$d").map({$d~$_}).Slip;
        }

        spurt $to, @links.join("\n");
        pretty-print("Link file saved in $to");

    }
}  

sub pretty-print($msg) {
    say "\e[1;36m$msg \e[0m";
}
