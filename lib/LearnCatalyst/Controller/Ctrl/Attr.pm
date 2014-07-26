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

sub intro :Global {
  my ($self, $c) = @_;
  $c->response->body('HelloWorld');
}

# [/linux/sample]でアクセス可能になる
#__PACKAGE__->config->{'namespace'} = 'linux/sample';



=encoding utf8

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
