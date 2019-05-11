%packages

# This package breaks build when trying to build fedora-disk
# so exclude it. Does not affect fedora-live-workstation which
# is the desired build target anyway.
#-bcm283x-firmware


util-linux-user
util-linux
yum-utils

## Disk tools
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
gvim
#neovim
#nano
#emacs

## Terminal multiplexing
tmux
screen

## Version control
git
bzr
cvs
mercurial
gitg
subversion

## Browsers
links
lynx
firefox
#mozilla-https-everywhere
#mozilla-noscript
#mozilla-adblockplus
chromium
chromedriver
chrome-remote-desktop

## Internet
filezilla
thunderbird

## Virtualization
gnome-boxes
virt-manager

## Electronics
arduino
fritzing





gpg
keepass


## Rust
cargo

## Assembly
nasm
nasm-doc


figlet


## For VSCode building
#libXt-devel
#libXScrnSaver
#libxkbfile-devel
#libsecret-devel

## For Electron building
#dnf install clang dbus-devel gtk3-devel libnotify-devel \
#                   libgnome-keyring-devel xorg-x11-server-utils libcap-devel \
#                   cups-devel libXtst-devel alsa-lib-devel libXrandr-devel \
#                   GConf2-devel nss-devel python-dbusmock

## For GitHub desktop building?


## Databases
mariadb-server
postgresql-server
sqlite
sqlite-devel
derby


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
colordiff

doxygen

patch
patchutils




expect
highlight
lcov
meld

nemiver
rcs
robodoc
scanmem
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




qt5
qt5-devel
qt5ct
qt5-designer
qt-creator

glade3




httpd
tomcat
nginx

ansible
jenkins


gnome-builder
flatpak
cmatrix

freeglut
godot
gimp
kolourpaint
inkscape
audacity
blender

espeak-ng
espeak-ng-devel
espeak-ng-doc
espeak-ng-vim

# https://ibotpeaches.github.io/Apktool/install/
# https://github.com/pxb1988/dex2jar/releases
# https://github.com/pxb1988/dex2jar/releases/download/2.0/dex-tools-2.0.zip


%end


# codeblocks?
