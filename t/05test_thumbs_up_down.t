use Test;
BEGIN { plan tests => 2 }
use WebService::UrbanDictionary;

my $up = thumbs_up('perl');
my $down = thumbs_down('perl');

ok($up =~ m/[0-9]/);
ok($down =~ m/[0-9]/);