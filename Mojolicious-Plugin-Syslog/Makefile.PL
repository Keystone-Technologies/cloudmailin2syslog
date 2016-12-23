use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::Syslog',
  VERSION_FROM => 'lib/Mojolicious/Plugin/Syslog.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '7.12'},
  test         => {TESTS => 't/*.t'}
);
