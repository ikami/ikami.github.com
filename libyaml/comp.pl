#!/usr/local/bin/perl -w

use Benchmark qw(:all);

use YAML::Syck qw();
use YAML::XS qw();

$yaml = `cat small.yaml`;
$size = -s "small.yaml";
print "file size: " . $size . "b\n";

cmpthese( 10000, {
  'YAML::Syck-' . $YAML::Syck::VERSION => sub { my $obj = YAML::Syck::Load($yaml); my $string = YAML::Syck::Dump($obj); },
    'YAML::XS-' . $YAML::XS::VERSION => sub { my $obj = YAML::XS::Load($yaml); my $string = YAML::XS::Dump($obj); },
  }
);

$yaml = `cat large.yaml`;
$size = -s "large.yaml";
print "file size: " . $size . "b\n";

cmpthese( 10000, {
  'YAML::Syck-' . $YAML::Syck::VERSION => sub { my $obj = YAML::Syck::Load($yaml); my $string = YAML::Syck::Dump($obj); },
    'YAML::XS-' . $YAML::XS::VERSION => sub { my $obj = YAML::XS::Load($yaml); my $string = YAML::XS::Dump($obj); },
  }
);


