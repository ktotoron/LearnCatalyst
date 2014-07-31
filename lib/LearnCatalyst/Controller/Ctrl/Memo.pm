package LearnCatalyst::Controller::Ctrl::Memo;
use Moose;
use namespace::autoclean;


BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

LearnCatalyst::Controller::Ctrl::Memo - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body('Matched LearnCatalyst::Controller::Ctrl::Memo in Ctrl::Memo.');
}

# command
# script/learncatalyst_create.pl controller Ctrl::Memo
# mkdir -p root/ctrl/memo

sub note_base :Chained('/') :PathPart('memo') :CaptureArgs(0) {
  my ($self, $c) = @_;
  $ENV{DBI_TRACE}=2;
  $c->stash->{memo} = $c->model('LearnCatalyst::Memo');
}

sub note_all :Chained('note_base') :PathPart('all') :Args(0) {
  my ($self, $c) = @_;
  $c->stash->{list} = [ $c->stash->{memo}->search(
    {}
    ,
    {
      order_by => { -asc => 'updated'}
    }
  )];
}

sub note_create :Chained('note_base') :PathPart('create') :Args(0) {
  my ($self, $c) = @_;
  if ( $c->req->method eq 'POST' ) {
    $c->stash->{memo}->create(
    {
      title => $c->request->body_params->{title},
      body => $c->request->body_params->{body},
      updated => \'NOW()',
    });
    $c->response->redirect($c->uri_for('/memo/all'), 303);
  }
}

sub note_details :Chained('note_base') :PathPart('') :CaptureArgs(1) {
  my ($self, $c, $mid) = @_;
  $c->stash->{item} = $c->stash->{memo}->find($mid);
  if ( !$c->stash->{item} ) {
    $c->response->body("Not Found Memo ${mid}");
    # Chain End
    $c->detach();
  }
}

# 表示
sub note_show :Chained('note_details') :PathPart('') :Args(0) {}

# 編集
sub note_edit :Chained('note_details') :PathPart('edit') :Args(0) {
  my ($self, $c) = @_;
  if ( $c->req->method eq 'POST' ) {
    my $row = $c->stash->{item};
    $row->title($c->request->body_params->{title});
    $row->body($c->request->body_params->{body});
    $row->updated(\'NOW()');
    $row->update;
    $c->response->redirect($c->uri_for('/memo/all'), 303);
  }

}


# 削除
sub note_delete :Chained('note_details') :PAthPart('delete') :Args(0) {
  my ($self, $c) = @_;
  if ( $c->req->method eq 'POST' ) {
    $c->stash->{item}->delete;
    $c->response->redirect('/memo/all', 303);
  }
  $c->response->body('AccessDenied');
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
