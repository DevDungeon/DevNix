#devnix-packages.ks



%packages

# This package breaks build when trying to build fedora-disk
# so exclude it. Does not affect fedora-live-workstation which
# is the desired build target anyway.
#-bcm283x-firmware


util-linux-user
util-linux
yum-utils

blivet-gui
gparted

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
mozilla-https-everywhere
mozilla-noscript
mozilla-adblockplus
chromium
chromedriver
chrome-remote-desktop

filezilla
thunderbird

gnome-boxes
virt-manager
gimp
kolourpaint

arduino
fritzing

nasm


gpg
keepass

## Ruby
ruby
ruby-doc
ruby-ncurses
jruby
ruby-devel
rubygem-pry
rubygem-tk
rubygem-selenium-webdriver

## Rust
cargo

## JavaScript
nodejs
nodejs-docs
nodejs-typescript
nodejs-ansi
nodejs-yarn
nodejs-sqlite3
nodejs-markdown
nodejs-discord-js

golang

figlet

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
jsoup
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
pidgin
pidgin-otr
pidgin-discord
pidgin-docs
libpurple-devel

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

SDL2-devel
SDL2_gfx-docs
SDL2_gfx-devel
SDL2_ttf-devel
SDL2_image-devel
SDL2_mixer-devel
SDL2_net-devel

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


godot

qt5
qt5-devel
qt5ct
qt5-designer
qt-creator

glade3



python3-pygame
python3-docs
python3-qt5
python3-qt5-devel
python3-docutils
python3-sphinx
python3-sphinx_rtd_theme
python3-devel
python3-idle
python3-ipython
python3-bpython
python3-gunicorn
python3-blivet
python3-urwid
python3-selenium
python3-django
python3-flask
python3-pylint
python3-certbot
python3-mod_wsgi
python3-tkinter
python3-beautifulsoup4
python3-gobject
python3-paramiko
uwsgi

php
composer
php-pgsql
php-mysqlnd

httpd
tomcat
nginx

ansible
jenkins


gnome-builder
flatpak
cmatrix

inkscape
audacity
blender



# https://ibotpeaches.github.io/Apktool/install/
# https://github.com/pxb1988/dex2jar/releases
# https://github.com/pxb1988/dex2jar/releases/download/2.0/dex-tools-2.0.zip


%end


# codeblocks?
