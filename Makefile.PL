
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Libraries shared between Net::OpenID::Consumer and Net::OpenID::Server",
  "AUTHOR" => "Robert Norris <rob\@eatenbyagrue.org>, Roger Crew <crew\@cs.stanford.edu>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Net-OpenID-Common",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Net::OpenID::Common",
  "PREREQ_PM" => {
    "Crypt::DH::GMP" => "0.00011",
    "Encode" => 0,
    "HTML::Parser" => "3.40",
    "HTTP::Headers::Util" => 0,
    "HTTP::Message" => "5.814",
    "HTTP::Request" => 0,
    "HTTP::Status" => 0,
    "MIME::Base64" => 0,
    "Math::BigInt" => 0,
    "Time::Local" => 0,
    "XML::Simple" => 0
  },
  "VERSION" => "1.19",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



