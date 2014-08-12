package WebService::UrbanDictionary::Term::Definition;

# ABSTRACT: Functions for retrieving data from WebService::UrbanDictionary::Term objects.

use Moo;

has 'defid'        => ( is => 'ro' );
has 'word'         => ( is => 'ro' );
has 'author'       => ( is => 'ro' );
has 'permalink'    => ( is => 'ro' );
has 'definition'   => ( is => 'ro' );
has 'example'      => ( is => 'ro' );
has 'thumbs_up'    => ( is => 'ro' );
has 'thumbs_down'  => ( is => 'ro' );
has 'current_vote' => ( is => 'ro' );

1;

__END__

=pod

=head1 NAME

WebService::UrbanDictionary::Term::Definition - Functions for retrieving data from WebService::UrbanDictionary::Term objects.

=head1 VERSION

version 2.000

=head1 SYNOPSIS

	use WebService::UrbanDictionary;

	my $ud = WebService::UrbanDictionary->new;

	my $results = request('perl'); 

	for my $each (@{ $results->definitions }) {
		printf "Definition: %s\n(by %s)\n\n", $each->definition, $each->author;
	}

=head1 DESCRIPTION

L<WebService::UrbanDictionary> provides an object-oriented to UrbanDictionary's online JSON API.

=head2 Methods

=over 12

=item C<< defid >>
=item C<< word >>
=item C<< author >>
=item C<< permalink >>
=item C<< definition >>
=item C<< example >>
=item C<< thumbs_up >>
=item C<< thumbs_down >>
=item C<< current_vote >>

=back

=head1 SEE ALSO

L<WWW::Search::UrbanDictionary>

=cut

=head1 AUTHOR

William Woodruff <william@tuffbizz.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by William Woodruff.

This is free software, licensed under:

  The MIT (X11) License

=cut
