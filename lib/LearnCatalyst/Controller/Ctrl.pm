package LearnCatalyst::Controller::Ctrl;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

LearnCatalyst::Controller::Ctrl - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

# script/learncatalyst_create.pl controller Ctrl


sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched LearnCatalyst::Controller::Ctrl in Ctrl.');
}


# ここから先ChainedParent
# 親コントローラの同名のアクションに連鎖可能
# [http://localhost:10080/parent/child]でアクセス可能
sub chain_parent :Chained :PathPart('parent') :CaptureArgs(0) {
  my ($self, $c) = @_;
  $c->stash->{body} .= '<p> chain_parent_action[Ctrl] </p>';
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
