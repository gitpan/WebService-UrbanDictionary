# UrbanDictionary.pm
# Grabs UrbanDictionary.com definitions and other data using its JSON API
# Author: William Woodruff
# License: MIT
# ABSTRACT: An interface to UrbanDictionary.com's JSON API

package WebService::UrbanDictionary;

use strict;
use warnings;

use Exporter;
use Carp;
use LWP::Simple;
use JSON qw(decode_json);
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

$VERSION = 1.003;
@ISA = qw(Exporter);
@EXPORT = qw(define_word defid author permalink thumbs_up thumbs_down tags result_type);
@EXPORT_OK = qw(define_word defid author permalink thumbs_up thumbs_down tags result_type);

my $urban_url = "http://api.urbandictionary.com/v0/define?term=";

sub define_word {
	my $word = shift or carp "No word provided.";
	my $i = shift || 0;
	my $response = decode_json(get($urban_url . $word)) or carp "Error during fetch/decode.";
	return $response->{list}[$i]->{definition};
}

sub defid {
	my $word = shift or carp "No word provided.";
	my $i = shift || 0;
	my $response = decode_json(get($urban_url . $word)) or carp "Error during fetch/decode.";
	return $response->{list}[$i]->{defid};
}

sub author {
	my $word = shift or carp "No word provided.";
	my $i = shift || 0;
	my $response = decode_json(get($urban_url . $word)) or carp "Error during fetch/decode.";
	return $response->{list}[$i]->{author};
}

sub permalink {
	my $word = shift or carp "No word provided.";
	my $i = shift || 0;
	my $response = decode_json(get($urban_url . $word)) or carp "Error during fetch/decode.";
	return $response->{list}[$i]->{permalink};
}

sub thumbs_up {
	my $word = shift or carp "No word provided.";
	my $i = shift || 0;
	my $response = decode_json(get($urban_url . $word)) or carp "Error during fetch/decode.";
	return $response->{list}[$i]->{thumbs_up};
}

sub thumbs_down {
	my $word = shift or carp "No word provided.";
	my $i = shift || 0;
	my $response = decode_json(get($urban_url . $word)) or carp "Error during fetch/decode.";
	return $response->{list}[$i]->{thumbs_down};
}

sub tags {
	my $word = shift or carp "No word provided.";
	my $i = shift || 0;
	my $response = decode_json(get($urban_url . $word)) or carp "Error during fetch/decode.";
	return $response->{tags};
}

sub result_type {
	my $word = shift or carp "No word provided.";
	my $i = shift || 0;
	my $response = decode_json(get($urban_url . $word)) or carp "Error during fetch/decode.";
	return $response->{result_type};
}

1;

__END__

=pod

=head1 NAME

WebService::UrbanDictionary - An interface to UrbanDictionary.com's JSON API

=head1 VERSION

version 1.003

=head1 SYNOPSIS

C<use WebService::UrbanDictionary;>

C<< my $definition = define_word('perl'); >>

C<< my $second_def = define_word('perl', 1); >> 

=head1 DESCRIPTION

WebService::UrbanDictionary provides a set of procedural methods for accessing definitions
and other data available through UrbanDictionary's online JSON API.

=head2 Methods

=over 12

=item C<< define_word(word, index) >>

Returns the definition for the given word at the given index.
If no index is provided, the first definition is assumed (index 0).

=item C<< defid(word, index) >>

Returns the definition id for the given word at the given index.
If no index is provided, the first definition's defid is assumed (index 0).

=item C<< author(word, index) >>

Returns the author of the word's definition at the given index.
If no index is provided, the first definition's author is assumed (index 0).

=item C<< permalink(word, index) >>

Returns a permalink to the word's definition at the given index.
If no index is provided, the first definition's permalink is assumed (index 0).

=item C<< thumbs_up(word, index) >>

Returns the number of 'thumbs up's given to the word's definition at the given index.
If no index is provided, the first definition's thumbs up is assumed (index 0).

=item C<< thumbs_down(word, index) >>

Returns the number of 'thumbs down's given to the word's definition at the given index.
If no index is provided, the first definition's thumbs down is assumed (index 0).

=item C<< tags(word) >>

Returns an array of tags associated with the given word.

=item C<< result_type(word) >>

Returns the result type. 

=back

=head1 SEE ALSO

L<http://search.cpan.org/~sock/WWW-Search-UrbanDictionary-0.4/lib/WWW/Search/UrbanDictionary.pm>

=cut

=head1 AUTHOR

William Woodruff <william@tuffbizz.com>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by William Woodruff.

This is free software, licensed under:

  The MIT (X11) License

=cut
