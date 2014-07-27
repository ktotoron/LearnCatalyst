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


# Chained [http://localhost/first/second/1111/third]で呼び出し可能

# Chained : 連鎖するアクションの定義
# PathPart : 部分パス名を指定
# CaptureArgs : パス情報の引数を制限(連鎖の途中でのみ指定可能, 連鎖の途中の場合は省略不可能)
# 最上位アクション(/first)
sub chain_top :Chained('/') :PathPart('first') :CaptureArgs(0) {
  my ($self, $c) = @_;
  $c->stash->{body} = '<p> chain_top_action </p>';
}


# Chained_topから連鎖してくる
# 連鎖するアクション
sub chain_second :Chained('chain_top') :PathPart('second') :CaptureArgs(1) {
  my ($self, $c, $id) = @_;
  $c->stash->{body} .= "<p> chain_second_action : ${id} </p>";
}


# Chained_topから連鎖してくる
# 連鎖するアクション
sub chain_third :Chained('chain_second') :PathPart('third') {
  my ($self, $c) = @_;
  $c->stash->{body} .= '<p> chain_third_action </p>';
  $c->response->body($c->stash->{body});
}


# PathPartの省略
# Chained [http://localhost/first/second/1111/chain_path]で呼び出し可能
sub chain_path :Chained('chain_second') :PathPart {
  my ($self, $c) = @_;
  $c->stash->{body} .= '<p> chain_path_action </p>';
  $c->response->body($c->stash->{body});
}

# PathPartの省略
# Chained [http://localhost:10080/first/second/1112/chain_path_args/aaa]で呼び出し可能
sub chain_path_args :Chained('chain_second') :PathPart :Args(1) {
  my ($self, $c, $arg1) = @_;
  $c->stash->{body} .= "<p> chain_path_args_action: ${arg1} </p>";
  $c->response->body($c->stash->{body});
}


# PathPrefixの省略
# Chained [http://localhost:10080/first/second/1112/ctrl/attr]で呼び出し可能
sub chain_path_prefix :Chained('chain_second') :PathPrefix {
  my ($self, $c) = @_;
  $c->stash->{body} .= '<p> chain_path_prefix_action </p>';
  $c->response->body($c->stash->{body});
}



# 最終地点 
# [http://localhost:10080/parent/child]でアクセス可能
sub chain_parent :ChainedParent :PathPart('child') {
  my ($self, $c) = @_;
  $c->stash->{body} .= '<p> chain_parent_action[Ctrl/Attr] </p>';
  $c->response->body($c->stash->{body});
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
