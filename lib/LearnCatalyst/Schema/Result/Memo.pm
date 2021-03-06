use utf8;
package LearnCatalyst::Schema::Result::Memo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

LearnCatalyst::Schema::Result::Memo

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<memo>

=cut

__PACKAGE__->table("memo");

=head1 ACCESSORS

=head2 mid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 body

  data_type: 'text'
  is_nullable: 1

=head2 updated

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "mid",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "body",
  { data_type => "text", is_nullable => 1 },
  "updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</mid>

=back

=cut

__PACKAGE__->set_primary_key("mid");


# Created by DBIx::Class::Schema::Loader v0.07040 @ 2014-07-15 15:22:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BxYeT4NZNlQ/uMIY204H5A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
