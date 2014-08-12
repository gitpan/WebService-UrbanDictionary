use Test::More;
BEGIN { plan tests => 2 }
use WebService::UrbanDictionary;

my $ud = WebService::UrbanDictionary->new;

ok(defined $ud);

my $data = $ud->request("perl");

ok(defined $data);

#ok($data->definition =~ m/pur'-el/);
