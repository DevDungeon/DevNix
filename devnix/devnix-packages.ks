#devnix-packages.ks



%packages

# This package breaks build when trying to build fedora-disk
# so exclude it. Does not affect fedora-live-workstation which
# is the desired build target anyway.
#-bcm283x-firmware

-simple-scan
-gnome-contacts
-cheese
-gnome-maps
-gnome-photos
-totem

util-linux-user
yum-utils

# for pngtopnm to make .lss files
netpbm-progs
# for ppmtolss16 to make .lss files
syslinux
syslinux-perl
livecd-tools

zsh
fish

vim
neovim
gvim

tmux
screen

git
#emacs

links
lynx
firefox
chromium
filezilla
thunderbird
gnome-boxes
gimp
kolourpaint

arduino
fritzing

gpg
keepass
ruby
jruby
cargo
nodejs
golang

# For VSCode building
libXt-devel
libXScrnSaver
libxkbfile-devel
libsecret-devel



java-1.8.0-openjdk
java-1.8.0-openjdk-devel
java-1.8.0-openjdk-openjfx
java-1.8.0-openjdk-openjfx-devel
java-1.8.0-openjdk-src
java-1.8.0-openjdk-javadoc

# Maybe too much space
#java-11-openjdk
#java-11-openjdk-headless
#java-11-openjdk-devel
#java-11-openjdk-src
#java-11-openjdk-javadoc

# MariaDB (Mysql) client+server
mariadb-server
postgresql-server
sqlite

ant
maven
gradle

## Docker breaks the auto login on livecd
#docker

## Chat
pidgin-otr

## CLI apps
irssi
rtorrent
mutt
vifm
mc

## Dev tools
#gcc
#gcc-c++
#make
#autoconf
#pkgconfig

## "Development Tools"
#gettext
#diffstat
#doxygen
#git
#patch
#patchutils
#subversion
#bzr
#colordiff
#cvs
#expect
#highlight
#lcov
#meld
#mercurial
#nemiver
#rcs
#robodoc
#scanmem
#gitg
#manedit

# security tools

nmap
wireshark
libpcap
libpcap-devel
bind-utils
traceroute



#amass
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

qt5-designer
python3-qt5-devel

python-devel
ruby-devel
jruby-devel
#jruby-doc
#python3-doc
#ruby-doc
python3-idle
rubygem-pry
rubygem-tk

httpd
tomcat
nginx


ansible
jenkins

%end


# codeblocks?
