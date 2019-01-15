package Acme::CM::Get;

# DATE
# VERSION

use strict 'subs', 'vars';
use warnings;

sub import {
    my $pkg  = shift;

    my $mod = shift or die "import(): Please supply module name";
    $mod = "Acme::CPANModules::$mod" unless $mod =~ /\AAcme::CPANModules::/;
    (my $mod_pm = "$mod.pm") =~ s!::!/!g;
    require $mod_pm;

    my $caller = caller();
    {
        no warnings 'once';
        # export $LIST
        *{"$caller\::LIST"} = \${"$mod\::LIST"};
    }
}

1;
# ABSTRACT: Shortcut to retrieve Acme::CPANModules list

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

Load L<Acme::CPANModules::XSVersions> then import
C<$Acme::CPANModules::XSVersions::LIST>:

% perl -MAcme::CM::Get=XSVersions -E'# do something with $LIST ...'


=head1 DESCRIPTION


=head1 SEE ALSO

L<Acme::CPANModules>

L<cpanmodules> from L<App::cpanmodules>
