package WebService::UrbanDictionary;

# ABSTRACT: An OO interface to UrbanDictionary.com's JSON API.

our $VERSION = "2.010";

use Carp;
use strict;
use warnings;

use Moo;
use JSON;
use LWP::UserAgent;
use WebService::UrbanDictionary::Term;

has _ua            => ( is => 'ro', default => sub { LWP::UserAgent->new() } );
has _end_point_url => ( is => 'ro', default => sub { 'http://api.urbandictionary.com/v0/define?term=' } );

sub request {
	my $self = shift;
	my $term = shift or carp "No term provided.";
	my $url = $self->_end_point_url . $term;
	my $res = decode_json $self->_ua->get( $url )->decoded_content or carp "Error during fetch/decode.";
	$res->{term} = $term;
	return WebService::UrbanDictionary::Term->new( $res );
}

1;

__END__

=pod

=head1 NAME

WebService::UrbanDictionary - An OO interface to UrbanDictionary.com's JSON API.

=head1 VERSION

version 2.010

=head1 SYNOPSIS

	use WebService::UrbanDictionary;

	my $ud = WebService::UrbanDictionary->new;

	my $results = request('perl'); 

	for my $each (@{ $results->definitions }) {
		printf "Definition: %s\n(by %s)\n\n", $each->definition, $each->author;
	}

=head1 DESCRIPTION

WebService::UrbanDictionary provides an object-oriented to UrbanDictionary's online JSON API.

=head2 Methods

=over 12

=item C<< request(word) >>

Requests data on the given word from UrbanDictionary's API.
Returns a L<WebService::UrbanDictionary::Term> object.

=back

=head1 SEE ALSO

L<WWW::Search::UrbanDictionary>

=head1 AUTHOR

William Woodruff <william@tuffbizz.com>

=head1 CONTRIBUTOR

=for stopwords Gabriel Vieira

Gabriel Vieira <gabriel.vieira@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by William Woodruff.

This is free software, licensed under:

  The MIT (X11) License

=cut
