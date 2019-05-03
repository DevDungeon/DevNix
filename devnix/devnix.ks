%include ../fedora-live-workstation.ks

#network --bootproto=dhcp --device=eth0 --activate --onboot=on

# Override disk size in fedora-live-workstation.ks so it
# has enough room to build. Does not indicate size of final iso
part / --size 9656

%packages

# This package breaks build when trying to build fedora-disk
# so exclude it. Does not affect fedora-live-workstation which
# is the desired build target anyway.
#-bcm283x-firmware

util-linux-user
zsh
vim
neovim
gvim
emacs
gcc-c++
libXt-devel
libXScrnSaver
libxkbfile-devel
libsecret-devel
chromium
gpg
keepass
filezilla
ruby
jruby
cargo
nodejs
golang
java-1.8.0-openjdk
java-1.8.0-openjdk-devel
java-1.8.0-openjdk-openjfx
ant
maven
gradle
# Docker breaks the auto login on livecd
#docker
pidgin-otr

gettext
diffstat
doxygen
git
patch
patchutils
subversion
systemtap
archmage
buildbot
bzr
colordiff
cvs
cvs2cl
cvsgraph
cvsps
darcs
dejagnu
expect
git-annex
#git-cola
git2cl
gtranslator
highlight
lcov
meld
mercurial
monotone
myrepos
nemiver
quilt
rapidsvn
rcs
robodoc
scanmem
subunit
svn2cl
tig
tkcvs
#tortoisehg
translate-toolkit
utrac

gitg
#qgit
manedit
#gambas3-ide

%end


%post



yum groupinstall -y "Development Tools"

Echo "TEsting ==========================================================================================================="

echo "Current dir:"
echo $PWD
echo $(pwd)


%end

%post --nochroot

echo "Testing nochroot as well"

echo "pwd"
echo $PWD
echo $(pwd)

echo "install root: expect: / or something "
echo $INSTALL_ROOT

echo "liveroot: expect /mnt/ or /tmp/"
echo $LIVE_ROOT




#dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# Hack font
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
rm Hack-v3.003-ttf.zip
sudo mv ttf $INSTALL_ROOT/usr/share/fonts/hack

# Ubuntu font
wget https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip
unzip fad7939b-ubuntu-font-family-0.83.zip
sudo mv ubuntu-font-family-0.83 $INSTALL_ROOT/usr/share/fonts

#fc-cache -f -v


#sudo systemctl enable docker
#sudo systemctl start docker
#sudo groupadd docker
#sudo chown root:docker /var/run/docker.sock
#docker pull alpine



#touch testing-where-iam.txt
#cd /root
#touch testing-root-home.txt
#cd /
#touch testing-realroot.txt

%end

