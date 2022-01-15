#!/usr/bin/perl -w

# *************************************************************************
#
# This script should be run after things are ready after the execution of
# the script "texlive-install.sh". This tiny script ensures you have some 
# missing packages installed, since - you know - the minimal TeXlive is 
# too barren to be effective. Nothing sophisticated here, just
#
#   $ ./post-install.pl
# *************************************************************************

while (<DATA>) {
  unless ($_ =~ /^\s*$/ or $_ =~ /^\s*#/) {
    $_ =~ s/^\s+|\s+$//g;
    system "tlmgr install $_";
  }
}

__DATA__

# base
latex
texdoc
texliveonfly

# languages
polyglossia
hyphen-italian
hyphen-english

