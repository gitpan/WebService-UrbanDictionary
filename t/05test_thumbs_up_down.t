use Test;
BEGIN { plan tests => 3 }
use WebService::UrbanDictionary;

ok(1);

my $ud = WebService::UrbanDictionary->new(word => 'perl');

my $up = thumbs_up();
my $down = thumbs_down();

ok($up =~ m/[0-9]/);
ok($down =~ m/[0-9]/);