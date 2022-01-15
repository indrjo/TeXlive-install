#!/bin/bash

# USAGE *******************************************************************
#
# Just run:
#
#   $ ./texlive-minimal.sh
#
# You need a stable internet connection through the whole procedure. If all
# succeeds, some little refinement is needed: just append at the end of the
# file "~/.bashrc" the lines:
#
# export PATH=/home/indrjo/texlive/2021/bin/x86_64-linux:$PATH
# export MANPATH=/home/indrjo/texlive/2021/texmf-dist/doc/man:$MANPATH
# export INFOPATH=/home/indrjo/texlive/2021/texmf-dist/doc/info:$INFOPATH
#
# and then issue the command
#
#   $ . ~/.bashrc
#
# Then you can now go on and run the script "post-install.pl":
#
#   $ ./post-install.pl
#
# *************************************************************************

# Get the needed "*.tar.gz" archive from the net.
wget "https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"

# If "install-tl" does not exist, then create it and `cd` there. This is 
# the place where the installation process takes place.
[ -d install-tl ] || mkdir ./install-tl; cd ./install-tl

# All the extracted things are stored into the directory "install-tl".
tar -xzf ../install-tl-unx.tar.gz --strip-components 1

# The dedicated installer is a Perl script called "install-tl".
TEXLIVE_INSTALL_PREFIX=~/texlive ./install-tl --scheme minimal

# ... now, the user shall type 'I' and hit 'Enter'...

# Go back to the parent directory and remove all the stuff used to perform
# the installation of our minimal TeXlive distribution.
cd ..; rm -rf install-tl*

