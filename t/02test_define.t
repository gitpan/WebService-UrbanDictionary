use Test;
BEGIN { plan tests => 1 }
use WebService::UrbanDictionary;

my $def = define_word('perl', 0);

ok($def =~ m/pur'-el/);