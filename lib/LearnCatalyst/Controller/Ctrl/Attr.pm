package LearnCatalyst::Controller::Ctrl::Attr;
use Moose;
use namespace::autoclean;


BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

LearnCatalyst::Controller::Ctrl::Attr - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched LearnCatalyst::Controller::Ctrl::Attr in Ctrl::Attr.');
}


# regex
sub regex_attr :Regex('^article/(\d{4})\.html$') {
  my ( $self, $c ) = @_;
  my $num = $c->request->captures->[0];
  $c->response->body("記事番号：${num}");
}

# regex
sub regex_attr_local :LocalRegex('^article/(\d{4})\.html$') {
  my ( $self, $c ) = @_;
  my $num = $c->request->captures->[0];
  $c->response->body("記事番号：${num}");
}

sub args_attr :Path('/args') :Args(2) {
  my ( $self, $c ) = @_;
  my $args = $c->request->args;
  $c->response->body("path_info: " . join(', ', @$args));
}




=encoding utf8

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
