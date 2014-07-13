use strict;
use warnings;

use LearnCatalyst;

my $app = LearnCatalyst->apply_default_middlewares(LearnCatalyst->psgi_app);
$app;

