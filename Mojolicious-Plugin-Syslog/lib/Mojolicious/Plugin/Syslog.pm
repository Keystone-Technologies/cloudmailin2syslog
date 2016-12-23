package Mojolicious::Plugin::Syslog;
use Mojo::Base 'Mojolicious::Plugin';

use Sys::Syslog qw(:standard :macros setlogsock);

our $VERSION = '0.01';

sub register {
  my ($self, $app, $config) = @_;
  setlogsock('udp');
  openlog($config->{ident}||$0, $config->{logopt}||"ndelay,pid", $config->{facility}||"local0");
  $app->helper('syslog.emerg' => sub { shift; syslog(LOG_EMERG, @_) });
  $app->helper('syslog.alert' => sub { shift; syslog(LOG_ALERT, @_) });
  $app->helper('syslog.crit' => sub { shift; syslog(LOG_CRIT, @_) });
  $app->helper('syslog.err' => sub { shift; syslog(LOG_ERR, @_) });
  $app->helper('syslog.error' => sub { shift->syslog->err(@_) });
  $app->helper('syslog.warning' => sub { shift; syslog(LOG_WARNING, @_) });
  $app->helper('syslog.warn' => sub { shift->syslog->warning(@_) });
  $app->helper('syslog.notice' => sub { shift; syslog(LOG_NOTICE, @_) });
  $app->helper('syslog.info' => sub { shift; syslog(LOG_INFO, @_) });
  $app->helper('syslog.debug' => sub { shift; syslog(LOG_DEBUG, @_) });
}

1;
__END__

=encoding utf8

=head1 NAME

Mojolicious::Plugin::Syslog - Mojolicious Plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('Syslog');

  # Mojolicious::Lite
  plugin 'Syslog';

=head1 DESCRIPTION

L<Mojolicious::Plugin::Syslog> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::Syslog> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicious.org>.

=cut
