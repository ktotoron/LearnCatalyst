use strict;
use warnings;
use Test::More;


use Catalyst::Test 'LearnCatalyst';
use LearnCatalyst::Controller::Ctrl::Memo;

ok( request('/ctrl/memo')->is_success, 'Request should succeed' );
done_testing();
