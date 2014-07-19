use Test;
BEGIN { plan tests => 3 }
use WebService::UrbanDictionary;

ok(1);

my $ud = WebService::UrbanDictionary->new(word => 'perl');

my $author = author();
my $author2 = author(1);

ok($author =~ m/[A-Za-z0-9\-_ ]/);
ok($author2 =~ m/[A-Za-z0-9\-_ ]/);