use Test;
BEGIN { plan tests => 2 }
use WebService::UrbanDictionary;

my $author = author('perl');
my $author2 = author('perl', 1);

ok($author =~ m/[A-Za-z0-9\-_ ]/);
ok($author2 =~ m/[A-Za-z0-9\-_ ]/);