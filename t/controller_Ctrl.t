use strict;
use warnings;
use Test::More;


use Catalyst::Test 'LearnCatalyst';
use LearnCatalyst::Controller::Ctrl;

ok( request('/ctrl')->is_success, 'Request should succeed' );
done_testing();
