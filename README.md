![Travis](https://travis-ci.com/antoniogamiz/Perl6-LinkHealth.svg?branch=master)

# NAME

Perl6::LinkHealth - Check that all links are generated using a previous file containing the links.

# SYNOPSIS

```

use Perl6::LinkHealth;

# Read the link file
my $links = read-from-file("./links.txt");

# Generates the links
my @links =list-directory("./doc");

# Save the link file
save-to-file($links);

```

#### sub list-directory

```perl6
sub list-directory (
    Str $dir
) returns Array
```

Read all files in \$dir recursively.

#### sub compare

```perl6
sub compare (
    Array @previous,
    Array @current
) returns (Array, Array)
```

Compare all links in @current with @previous. Returns the missing ones in the first element of the list and the new ones in the second.

#### sub read-from-file

```perl6
sub read-from-file(
    Str $path
) returns Seq
```

Read a Seq of links from a file.

#### sub save-to-file

```perl6
sub save-to-file(
    Str $path,
    Str $data
) returns Mu
```

Save in $path the content of $data.

# AUTHOR

Antonio Gámiz <antoniogamiz10@gmail.com>

# COPYRIGHT AND LICENSE

Copyright 2019 Antonio Gámiz

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
