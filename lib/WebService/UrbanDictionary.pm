# UrbanDictionary.pm
# Grabs UrbanDictionary.com definitions and other data using its JSON API
# Author: William Woodruff
# License: MIT
# ABSTRACT: An interface to UrbanDictionary.com's JSON API

package WebService::UrbanDictionary;

use strict;
use warnings;

use Exporter;
use LWP::Simple;
use JSON qw(decode_json);
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION = 1.002;
@ISA = qw(Exporter);
@EXPORT = qw(new define author permalink thumbs_up thumbs_down tags);
@EXPORT_OK = qw(new define author permalink thumbs_up thumbs_down tags);

our @definitions = undef;
our @tags = undef;
our $urban_url = "http://api.urbandictionary.com/v0/define?term=";

sub new {
	my ($class, %args) = @_;
	my $word = $args{word} or die "No word provided.";
	my $response = decode_json(get($urban_url . $word)) or die "Error during fetch/decode.";
	my $self = bless({}, $class);
	@definitions = @{$response->{list}};
	@tags = @{$response->{tags}};
	return $self;
}

sub define {
	my $index = shift || 0;
	return $definitions[$index]->{definition};
}

sub author {
	my $index = shift || 0;
	return $definitions[$index]->{author};
}

sub permalink {
	my $index = shift || 0;
	return $definitions[$index]->{permalink};
}

sub thumbs_up {
	my $index = shift || 0;
	return $definitions[$index]->{thumbs_up};
}

sub thumbs_down {
	my $index = shift || 0;
	return $definitions[$index]->{thumbs_down};
}

sub tags {
	return @tags;
}

1;

__END__

=pod

=head1 NAME

WebService::UrbanDictionary - An interface to UrbanDictionary.com's JSON API

=head1 VERSION

version 1.002

=head1 SYNOPSIS

C<use WebService::UrbanDictionary;>

C<< my $ud = WebService::UrbanDictionary->new(word => 'perl'); >>

C<< my $definition = $ud->define(); >>

C<< my $second_def = $ud->define(1); >> 

=head1 DESCRIPTION

WebService::UrbanDictionary provides a set of simple methods for accessing definitions
and other data available through UrbanDictionary's online JSON API.

=head2 Methods

=over 12

=item C<< new(word => $word) >>

Instantiates a new WebService::UrbanDictionary object with the given word.

=item C<< define(index) >>

Returns the definition for the current word at the given index.
If no index is given, the first definition is given (index 0).

=item C<< author(index) >>

Returns the author of the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< permalink(index) >>

Returns a permalink to the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< thumbs_up(index) >>

Returns the number of 'thumbs up's given to the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< thumbs_down(index) >>

Returns the number of 'thumbs down's given to the word's definition at the given index.
If no index is given, the first definition is given (index 0).

=item C<< tags() >>

Returns an array of tags associated with the given word.

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
