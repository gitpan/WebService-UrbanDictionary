use Test::More;
BEGIN { plan tests => 2 }
use LWP::Simple;

ok(1);

diag "\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
diag "!                                                                          !\n";
diag "! These tests WILL FAIL unless your computer is connected to the internet. !\n";
diag "!                                                                          !\n";
diag "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";

my $query = "http://google.com";
my $browser = LWP::UserAgent->new;
my $response = $browser->get( $query );

ok($response->code == 200);