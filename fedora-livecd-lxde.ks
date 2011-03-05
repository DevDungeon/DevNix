# fedora-livecd-lxde.ks
#
# Description:
# - Fedora Live Spin with the light-weight LXDE Desktop Environment
#
# Maintainer(s):
# - Christoph Wickert <cwickert@fedoraproject.org>

%include fedora-live-base.ks
%include fedora-live-minimization.ks

%packages
# LXDE desktop
@lxde-desktop
lxlauncher
obconf
lxdm

# internet
firefox
sylpheed
lostirc
transmission

# office
abiword
gnumeric
osmo
#glista

# graphics
epdfview
mtpaint

# audio & video
#gmixer
pavucontrol
lxmusic
asunder
gxine
gxine-mozplugin

# I'm looking for something smaller than
gnomebaker

# utils
galculator
parcellite
xpad

# system
gigolo

# more Desktop stuff
hal-storage-addon
alsa-plugins-pulseaudio
NetworkManager-gnome
java-1.6.0-openjdk-plugin
xcompmgr
xdg-user-dirs-gtk
# needed for xdg-open to support LXDE
perl-File-MimeInfo
# pam-fprint causes a segfault in LXDM when enabled
-fprintd-pam
# needed for automatic unlocking of keyring (#643435)
gnome-keyring-pam

# default artwork, subject to change - cwickert 2011-03-05
gtk-theme-engine-clearlooks
fedora-icon-theme

# use yumex instead of gnome-packagekit
yumex
-gnome-packagekit
-kpackagekit

# LXDE has lxpolkit. Make sure no other authentication agents end up in the spin.
-polkit-gnome
-polkit-kde

# make sure xfce4-notifyd is not pulled in
notification-daemon
-xfce4-notifyd

# make sure xfwm4 is not pulled in for firstboot
# https://bugzilla.redhat.com/show_bug.cgi?id=643416
metacity

# Command line
powertop
wget
yum-utils
yum-presto

# dictionaries are big
-aspell-*
-hunspell-*
-man-pages-*
-words

# save some space
-nss_db
-sendmail
ssmtp
-acpid

# drop some system-config things
-system-config-boot
#-system-config-language
-system-config-lvm
-system-config-network
-system-config-rootpassword
#-system-config-services
-policycoreutils-gui
-gnome-disk-utility

%end

%post
# LXDE and LXDM configuration

# create /etc/sysconfig/desktop (needed for installation)
cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/startlxde
DISPLAYMANAGER=/usr/sbin/lxdm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF
# disable screensaver locking and make sure gamin gets started
cat > /etc/xdg/lxsession/LXDE/autostart << FOE
/usr/libexec/gam_server
@lxpanel --profile LXDE
@pcmanfm --desktop --profile lxde
@pulseaudio -D
FOE

# set up preferred apps 
cat > /etc/xdg/libfm/pref-apps.conf << FOE 
[Preferred Applications]
WebBrowser=mozilla-firefox.desktop
MailClient=redhat-sylpheed.desktop
FOE

# set up auto-login for liveuser
sed -i 's|# autologin=dgod|autologin=liveuser|g' /etc/lxdm/lxdm.conf

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop
mkdir /home/liveuser/Desktop
cp /usr/share/applications/liveinst.desktop /home/liveuser/Desktop

# Add autostart for parcellite
cp /usr/share/applications/fedora-parcellite.desktop /etc/xdg/autostart

# this goes at the end after all other changes.
chown -R liveuser:liveuser /home/liveuser
restorecon -R /home/liveuser

EOF

%end

