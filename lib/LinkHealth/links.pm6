use v6;

unit module LinkHealth;

sub list-directory($dir = '.') is export {
    my @todo = $dir.IO.dir;
    @todo = @todo.duckmap( -> $_ where $_.d { @todo.push($_.IO.dir); $_; } );
    grep { !.IO.d }, @todo.List.flat;
    @todo.map({.Str});
}
