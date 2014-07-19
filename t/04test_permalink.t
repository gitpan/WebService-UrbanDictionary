use Test;
BEGIN { plan tests => 2 }
use WebService::UrbanDictionary;

ok(1);

my $ud = WebService::UrbanDictionary->new(word => 'perl');

my $link = permalink();

ok($link =~ m/http:\/\//);