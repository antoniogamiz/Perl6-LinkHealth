use v6;

unit module Perl6::LinkHealth;

sub list-directory($dir = '.') is export {
    my @files;
    my @todo = $dir.IO;
    while @todo {
        for @todo.pop.dir -> $path {
            @files.push($path) if !$path.d;
            @todo.push($path) if $path.d;
        }
    }
    @files;
}

sub compare(@previous, @current) is export {
    my %hash = Hash.new( @previous X False );
    my @missing;
    my @new;
    for @current -> $link {
        if %hash{$link}:!exists {
            @new.append($link);
        } else {
            %hash{$link} = True;
        }
    }
    for %hash.keys {@missing.append($_) if !%hash{$_}};
    (@missing, @new);
}

sub read-from-file($path) is export {
    my $content = slurp $path;
    $content.split("\n");
}

sub save-to-file($path, $data) is export {
    spurt $path, $data;
}
