package LearnCatalyst::Controller::Hello;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

LearnCatalyst::Controller::Hello - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched LearnCatalyst::Controller::Hello in Hello.');
}


sub introView :Local {
  my ($self, $c) = @_;
  $c->stash->{msg} = "HelloCatalyst";
}

sub list :Local {
  my ($self, $c) = @_;
  $c->stash->{list} = [$c->model('LearnCatalyst::Book')->all];
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
