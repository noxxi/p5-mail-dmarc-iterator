use strict;
use ExtUtils::MakeMaker 6.46;
require v5.10.0;

my @public_suffix = qw(
    IO::Socket::SSL::PublicSuffix
    Domain::PublicSuffix
    Mozilla::PublicSuffix
);
for(@public_suffix) {
    eval "require $_" or next;
    @public_suffix = ($_);
    last;
}

WriteMakefile(
    NAME => 'Mail::DMARC::Iterator',
    ABSTRACT => 'validate mails against DMARC policy the asynchronous way',
    AUTHOR => 'Steffen Ullrich <sullr@cpan.org>',
    LICENSE => 'perl',
    META_MERGE => {
        resources => {
            license     => 'http://dev.perl.org/licenses/',
            repository  => 'https://github.com/noxxi/p5-mail-dmarc-iterator',
            homepage  => 'https://github.com/noxxi/p5-mail-dmarc-iterator',
            bugtracker  => 'https://github.com/noxxi/p5-mail-dmarc-iterator/issues',
        },
    },
    PREREQ_PM => {
        'Mail::SPF::Iterator' => 1.115,
        'Mail::DKIM::Iterator' => 1.002,
	$public_suffix[0] => 0,
    },
    VERSION_FROM => 'lib/Mail/DMARC/Iterator.pm',
);

