use Test::More;
BEGIN { plan tests => 1 }
use LWP::UserAgent;

diag "\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
diag "!                                                                          !\n";
diag "! These tests WILL FAIL unless your computer is connected to the internet. !\n";
diag "!                                                                          !\n";
diag "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";

my $browser = LWP::UserAgent->new;
my $response = $browser->get("http://www.google.com");

ok($response->code == 200);

