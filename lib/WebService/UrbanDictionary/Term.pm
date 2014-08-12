package WebService::UrbanDictionary::Term;

# ABSTRACT: The Term object filled by WebService::UrbanDictionary objects.

use Moo;
use WebService::UrbanDictionary::Term::Definition;

has 'term'        => ( is => 'ro' );
has 'tags'        => ( is => 'ro' );
has 'result_type' => ( is => 'ro' );
has 'definitions' => ( is => 'ro' );
has 'sounds'      => ( is => 'ro' );

sub BUILD {
	my $self = shift;
	$self->{definitions} = [
		map { WebService::UrbanDictionary::Term::Definition->new($_) } @{$self->{list}}
	];
}

sub definition {
	my $defs = shift->definitions;
	return (wantarray ? @$defs : $defs->[0]->definition);
}

1;

__END__

=pod

=head1 NAME

WebService::UrbanDictionary::Term - The Term object filled by WebService::UrbanDictionary objects.

=head1 VERSION

version 2.002

=head1 SYNOPSIS

	use WebService::UrbanDictionary;

	my $ud = WebService::UrbanDictionary->new;

	my $results = request('perl'); 

	my $definition = $results->definition;

=head1 DESCRIPTION

WebService::UrbanDictionary provides an object-oriented to UrbanDictionary's online JSON API.

=head2 Methods

=over 12

=item C<< definition >>

Returns either an array of hashes containing API data, or the first definition of the word depending on context.
These elements can then be accessed with the methods in L<WebService::UrbanDictionary::Term::Definition>.

=back

=for Pod::Coverage BUILD

=head1 SEE ALSO

L<WWW::Search::UrbanDictionary>

=head1 AUTHOR

William Woodruff <william@tuffbizz.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by William Woodruff.

This is free software, licensed under:

  The MIT (X11) License

=cut
