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

## Stuff for building the images
# for pngtopnm to make .lss files
netpbm-progs
# for ppmtolss16 to make .lss files
syslinux
syslinux-perl
livecd-tools

## Shells
zsh
fish

## Editors
vim
neovim
gvim
#nano
#emacs

tmux
screen

git

links
lynx
firefox
chromium

filezilla
thunderbird

gnome-boxes
virt-manager
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


## Java stuff
java-1.8.0-openjdk
java-1.8.0-openjdk-devel
java-1.8.0-openjdk-openjfx
java-1.8.0-openjdk-openjfx-devel
java-1.8.0-openjdk-src
java-1.8.0-openjdk-javadoc
ant
maven
gradle
#java-11-openjdk
#java-11-openjdk-headless
#java-11-openjdk-devel
#java-11-openjdk-src
#java-11-openjdk-javadoc

## Databases
mariadb-server
postgresql-server
sqlite

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
gcc
gcc-c++
make
autoconf
pkgconfig

## "Development Tools"
gettext
diffstat
doxygen
patch
patchutils
subversion
bzr
colordiff
cvs
expect
highlight
lcov
meld
mercurial
nemiver
rcs
robodoc
scanmem
gitg
manedit

## Security tools

nmap
wireshark
libpcap
libpcap-devel
bind-utils
traceroute

#amass
#dig
wireshark
#sqlmap
#armitage
# pentestframework/ptf/metasploit?
# ida/olly?
gdb
# hashcat/jtr
# zap
# fiddler
# burp?

qt5-designer
python3-qt5-devel
python3-docutils
python3-sphinx
python3-sphinx_rtd_theme
python-devel
ruby-devel
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
