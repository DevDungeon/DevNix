%packages

# Set /etc/system-release to DevNix name to replace fedora
# Change icon https://bugzilla.redhat.com/show_bug.cgi?id=464120
# Rebranding https://opensourceforu.com/2010/01/roll-out-a-fedora-remix/
-fedora-logos
-fedora-release
-fedora-release-notes
-fedora-release-workstation
#-system-release
generic-release
generic-logos
generic-release-notes
#generic-release-workstation


%end


%post --nochroot --erroronfail
# Copy wallpaper and logos over
mkdir -p $INSTALL_ROOT/usr/local/share/backgrounds
cp resources/wallpaper.png $INSTALL_ROOT/usr/local/share/backgrounds/wallpaper.png
mkdir -p $INSTALL_ROOT/usr/local/share/devnix/logos
cp resources/logos/devnix_800px.png $INSTALL_ROOT/usr/local/share/devnix/logos/
cp resources/logos/devnix_2000px.png $INSTALL_ROOT/usr/local/share/devnix/logos/
cp resources/logos/devnix_800px.png $INSTALL_ROOT/usr/share/pixmaps/fedora-logo.png
%end



%post --erroronfail

# Turns off the "Pre-release/Testing" warning on installer
cat > /.buildstamp <<EOF
[Main]
IsFinal=true
EOF

## Backgrounds https://help.gnome.org/admin/system-admin-guide/stable/desktop-background.html.en
cat > /etc/dconf/db/local.d/00-backgrounds <<FOE
## Desktop wallpaper
[org/gnome/desktop/background]
picture-uri='file:///usr/local/share/backgrounds/wallpaper.png'
picture-options='stretched'
primary-color='000000'
secondary-color='333333'

## Login screen logo
# Originals /usr/share/pixmaps/fedora-gdm-logo.png # 151x48
[org/gnome/login-screen]
logo='/usr/local/share/devnix/logos/devnix_800px.png'

## Lock screen/screensaver image
[org/gnome/desktop/screensaver]
picture-uri='file:///usr/local/share/backgrounds/wallpaper.png'
FOE

dconf update



echo "DevNix" > /etc/system-release
#echo "DevNix" > /etc/issue
# sed -i s/Fedora/DevNix/g /etc/issue


# /usr/share/doc/generic-release-notes
# /usr/share/doc/generic-release-notes/README.Generic-Release-Notes
mkdir -p /usr/share/licenses/devnix-release
cat > /usr/share/licenses/devnix-release/README.md <<EOF
# DevNix Release Information

## Contact

nanodano@devdungeon.com

EOF

# https://www.freedesktop.org/software/systemd/man/os-release.html
cat > /usr/lib/os-release <<FOE
NAME=DevNix
VERSION="0 (Workstation Edition)"
ID=devnix
VERSION_ID=0
OS=DevNix
VER=0
VERSION_CODENAME="Primo"
PLATFORM_ID="platform:f30"
PRETTY_NAME="DevNix Workstation"
ANSI_COLOR="0;34"
LOGO=devnix-lettermark
CPE_NAME="cpe:/o:fedoraproject:fedora:30"
HOME_URL="https://www.devdungeon.com/devnix"
DOCUMENTATION_URL="https://www.devdungeon.com/devnix"
SUPPORT_URL="https://www.devdungeon.com/devnix"
BUG_REPORT_URL="https://www.devdungeon.com/devnix"
PRIVACY_POLICY_URL="https://www.devdungeon.com/content/privacy-policy"
VARIANT="Workstation Edition"
VARIANT_ID=workstation
FOE

cat > /usr/lib/fedora-release <<FOE
DevNix release 0
FOE


#Packages
#anaconda
#anaconda-install-env-deps
#anaconda-live
#@anaconda-tool
#initial-setup

# /usr/share/anaconda/boot/splash.png
# /usr/share/anaconda/boot/syslinux-splash.png

# /usr/share/anaconda/pixmaps/anaconda_header.png
# /usr/share/anaconda/pixmaps/progress_first.png
# /usr/share/anaconda/pixmaps/sidebar-bg.png
# /usr/share/anaconda/pixmaps/sidebar-logo.png
# /usr/share/anaconda/pixmaps/splash.png
# /usr/share/anaconda/pixmaps/topbar-bg.png

# /usr/share/doc/generic-logos
# /usr/share/doc/generic-logos/COPYING
# /usr/share/doc/generic-logos/COPYING-kde-logo
# /usr/share/doc/generic-logos/README

# /usr/share/firstboot/themes/generic
# /usr/share/firstboot/themes/generic/firstboot-left.png
# /usr/share/firstboot/themes/generic/workstation.png

# /usr/share/icons/hicolor/48x48/apps/anaconda.png
# /usr/share/icons/hicolor/scalable/apps/anaconda.svg
# /usr/share/icons/hicolor/scalable/apps/fedora-logo-icon.svg
# /usr/share/icons/hicolor/scalable/apps/fedora-logo-sprite.svg
# /usr/share/icons/hicolor/scalable/apps/start-here.svg
# /usr/share/icons/hicolor/scalable/places/start-here.svg

# /usr/share/icons/oxygen
# /usr/share/icons/oxygen/48x48
# /usr/share/icons/oxygen/48x48/apps
# /usr/share/icons/oxygen/48x48/apps/anaconda.png

# /usr/share/kde4/apps/ksplash/Themes/Leonidas/2048x1536/logo.png

# /usr/share/pixmaps/bootloader
# /usr/share/pixmaps/bootloader/fedora-media.vol
# /usr/share/pixmaps/bootloader/fedora.icns
# /usr/share/pixmaps/bootloader/fedora.vol

# /usr/share/pixmaps/fedora-logo-small.png
# /usr/share/pixmaps/fedora-logo-sprite.svg
# /usr/share/pixmaps/fedora-logo.png

# /usr/share/pixmaps/splash
# /usr/share/pixmaps/splash/gnome-splash.png

# /usr/share/pixmaps/system-logo-white.png

# /usr/share/plymouth/themes/charge/progress-00.png
# /usr/share/plymouth/themes/charge/progress-32.png
# /usr/share/plymouth/themes/charge/throbber-00.png
# /usr/share/plymouth/themes/charge/throbber-15.png



%end

%post --nochroot --erroronfail

# Set /etc/system-release to DevNix name to replace fedora
# Change icon https://bugzilla.redhat.com/show_bug.cgi?id=464120

#mkdir -p $INSTALL_ROOT/usr/share/anaconda/boot
#cp resources/anaconda/splash.png $INSTALL_ROOT/usr/share/anaconda/boot/splash.png
#cp resources/anaconda/syslinux-splash.png $INSTALL_ROOT/usr/share/anaconda/boot/syslinux-splash.png

mkdir -p $INSTALL_ROOT/usr/share/anaconda/pixmaps
cp resources/anaconda/anaconda_header.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/anaconda_header.png
cp resources/anaconda/progress_first.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/progress_first.png
cp resources/anaconda/sidebar-bg.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/sidebar-bg.png
cp resources/anaconda/sidebar-logo.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/sidebar-logo.png
cp resources/anaconda/splash.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/splash.png
cp resources/anaconda/topbar-bg.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/topbar-bg.png

# TODO do this once and store the .lss in repo # yum install netpbm-progs syslinux-perl
#pngtopnm $INSTALL_ROOT/usr/share/anaconda/boot/splash.png | ppmtolss16 > $INSTALL_ROOT/usr/share/anaconda/boot/splash.lss


#mkdir -p $INSTALL_ROOT/usr/share/firstboot/themes/generic
#cp resources/first_boot/themes/devnix/firstboot-left.png $INSTALL_ROOT/usr/share/firstboot/themes/generic
#cp resources/first_boot/themes/devnix/workstation.png $INSTALL_ROOT/usr/share/firstboot/themes/generic


# Change the name in the installer popup
sed -i s/Fedora/DevNix/g $INSTALL_ROOT/usr/share/anaconda/gnome/fedora-welcome
sed -i s/Fedora/DevNix/g $INSTALL_ROOT/usr/share/anaconda/gnome/fedora-welcome.desktop

# Change install button if desired
#$INSTALL_ROOT/usr/share/anaconda/gnome/install-button.png



## Installer Icons
cp resources/icons/devnix-lettermark-16.png $INSTALL_ROOT/usr/share/icons/hicolor/16x16/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-22.png $INSTALL_ROOT/usr/share/icons/hicolor/22x22/apps/anaconda.png
cp resources/icons/devnix-lettermark-16.png $INSTALL_ROOT/usr/share/icons/hicolor/16x16/apps/anaconda.png
cp resources/icons/devnix-lettermark-22.png $INSTALL_ROOT/usr/share/icons/hicolor/22x22/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-24.png $INSTALL_ROOT/usr/share/icons/hicolor/24x24/apps/anaconda.png
cp resources/icons/devnix-lettermark-24.png $INSTALL_ROOT/usr/share/icons/hicolor/24x24/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-32.png $INSTALL_ROOT/usr/share/icons/hicolor/32x32/apps/anaconda.png
cp resources/icons/devnix-lettermark-32.png $INSTALL_ROOT/usr/share/icons/hicolor/32x32/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-36.png $INSTALL_ROOT/usr/share/icons/hicolor/36x36/apps/anaconda.png
cp resources/icons/devnix-lettermark-36.png $INSTALL_ROOT/usr/share/icons/hicolor/36x36/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-48.png $INSTALL_ROOT/usr/share/icons/hicolor/48x48/apps/anaconda.png
cp resources/icons/devnix-lettermark-48.png $INSTALL_ROOT/usr/share/icons/hicolor/48x48/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-64.png $INSTALL_ROOT/usr/share/icons/hicolor/64x64/apps/anaconda.png
cp resources/icons/devnix-lettermark-64.png $INSTALL_ROOT/usr/share/icons/hicolor/64x64/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-72.png $INSTALL_ROOT/usr/share/icons/hicolor/72x72/apps/anaconda.png
cp resources/icons/devnix-lettermark-72.png $INSTALL_ROOT/usr/share/icons/hicolor/72x72/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-96.png $INSTALL_ROOT/usr/share/icons/hicolor/96x96/apps/anaconda.png
cp resources/icons/devnix-lettermark-96.png $INSTALL_ROOT/usr/share/icons/hicolor/96x96/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-128.png $INSTALL_ROOT/usr/share/icons/hicolor/128x128/apps/anaconda.png
cp resources/icons/devnix-lettermark-128.png $INSTALL_ROOT/usr/share/icons/hicolor/128x128/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-192.png $INSTALL_ROOT/usr/share/icons/hicolor/192x192/apps/anaconda.png
cp resources/icons/devnix-lettermark-192.png $INSTALL_ROOT/usr/share/icons/hicolor/192x192/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-256.png $INSTALL_ROOT/usr/share/icons/hicolor/256x256/apps/anaconda.png
cp resources/icons/devnix-lettermark-256.png $INSTALL_ROOT/usr/share/icons/hicolor/256x256/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-480.png $INSTALL_ROOT/usr/share/icons/hicolor/480x480/apps/anaconda.png
cp resources/icons/devnix-lettermark-480.png $INSTALL_ROOT/usr/share/icons/hicolor/480x480/apps/devnix-lettermark.png
cp resources/icons/devnix-lettermark-512.png $INSTALL_ROOT/usr/share/icons/hicolor/512x512/apps/anaconda.png
cp resources/icons/devnix-lettermark-512.png $INSTALL_ROOT/usr/share/icons/hicolor/512x512/apps/devnix-lettermark.png

rm $INSTALL_ROOT/usr/share/icons/hicolor/scalable/apps/anaconda.svg

# Change /usr/share/icons/hicolor/scalable/apps/
#fedora-logo-icon.svg #220x254
#fedora-logo-sprite.svg #220x254
# start-here.svg

gtk-update-icon-cache $INSTALL_ROOT/usr/share/icons/hicolor



figlet DevNix > $INSTALL_ROOT/etc/motd
cat >> $INSTALL_ROOT/etc/motd <<EOF
Welcome to DevNix. Visit https://www.devdungeon.com/devnix for help.
EOF

%end
