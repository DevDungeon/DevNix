#devnix-packages.ks



%packages

# This package breaks build when trying to build fedora-disk
# so exclude it. Does not affect fedora-live-workstation which
# is the desired build target anyway.
#-bcm283x-firmware

#-simple-scan
#-gnome-contacts
#-cheese
#-gnome-maps
#-gnome-photos
#-totem

util-linux-user
yum-utils

# for pngtopnm to make .lss files
netpbm-progs
# for ppmtolss16 to make .lss files
syslinux
syslinux-perl
livecd-tools

zsh
#fish

vim
#neovim
#gvim

tmux

git
#emacs

#links
#lynx
firefox
#chromium
#filezilla
#thunderbird

#gimp
#kolourpaint

#tomcat? httpd? nginx?

#arduino
#fritzing

#gpg
#keepass
#ruby
#jruby
#cargo
#nodejs
#golang

# For VSCode building
#libXt-devel
#libXScrnSaver
#libxkbfile-devel
#libsecret-devel



#java-1.8.0-openjdk
#java-1.8.0-openjdk-devel
#java-1.8.0-openjdk-openjfx
#java-1.8.0-openjdk-src
#java-1.8.0-openjdk-javadoc

# Maybe too much space
#java-11-openjdk
#java-11-openjdk-headless
#java-11-openjdk-devel
#java-11-openjdk-src
#java-11-openjdk-javadoc

# MariaDB (Mysql) client+server
#mariadb-server
#postgresql-server
sqlite

#ant
#maven
#gradle

# Docker breaks the auto login on livecd
#docker

# Chat
#pidgin-otr

# CLI apps
#irssi
#rtorrent
#mutt
#vifm
#mc

# Dev tools
gcc
gcc-c++
make
autoconf
pkgconfig

# "Development Tools"
# gettext
# diffstat
# doxygen
# git
# patch
# patchutils
# subversion
# systemtap
# archmage
# buildbot
# bzr
# colordiff
# cvs
# cvs2cl
# cvsgraph
# cvsps
# darcs
# dejagnu
# expect
# git-annex
# git2cl
# gtranslator
# highlight
# lcov
# meld
# mercurial
# monotone
# myrepos
# nemiver
# quilt
# rcs
# robodoc
# scanmem
# subunit
# svn2cl
# tig
# #tortoisehg
# translate-toolkit
# utrac
# gitg
# manedit

# security tools

#nmap
#wireshark
#libpcap
#libpcap-devel
#bind-utils
#traceroute



#amass
#nslookup
#dig
#wireshark
#sqlmap
#armitage
# pentestframework/ptf/metasploit?
# ida/olly?
# gdb
# hashcat/jtr
# zap
# fiddler
# burp?

%end


# codeblocks?
