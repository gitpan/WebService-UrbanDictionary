use Test;
BEGIN { plan tests => 1 }
use WebService::UrbanDictionary;

my $type = result_type('perl');

ok($type =~ m/exact/);