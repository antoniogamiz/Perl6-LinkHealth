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

#### sub save-to-file

#### sub read-from-file

# AUTHOR

Antonio Gámiz <mailto:antoniogamiz10@gmail.com>

# COPYRIGHT AND LICENSE

Copyright 2019 Antonio Gámiz

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
