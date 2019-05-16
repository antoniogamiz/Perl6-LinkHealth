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

sub read-from-file($path = "./links.txt") is export {
    my $content = slurp $path;
    $content;
}

sub save-to-file($data = "", $dir = ".") is export {
    spurt $dir ~ "/links.txt", $data;
}