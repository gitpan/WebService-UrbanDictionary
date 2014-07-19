use Test;
BEGIN { plan tests => 2 }
use WebService::UrbanDictionary;

ok(1);

my $ud = WebService::UrbanDictionary->new(word => 'perl');

my @tags = tags();

ok($tags[0] =~ m/[A-Za-z0-9\+\-_\[\] ]/);