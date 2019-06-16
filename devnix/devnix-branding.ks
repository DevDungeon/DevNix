%packages

-fedora-logos
-fedora-release
-fedora-release-notes
-fedora-release-workstation

generic-release
generic-logos
generic-release-notes

%end


%post --nochroot --erroronfail

# Replace logos
mkdir -p $INSTALL_ROOT/usr/local/share/devnix/logos
cp resources/logos/devnix_800px.png $INSTALL_ROOT/usr/local/share/devnix/logos/
cp resources/logos/devnix_2000px.png $INSTALL_ROOT/usr/local/share/devnix/logos/
cp resources/logos/devnix_800px.png $INSTALL_ROOT/usr/share/pixmaps/fedora-logo.png

%end



%post --erroronfail

##############################################################
## Turns off the "Pre-release/Testing" warning on installer ##
##############################################################

#cat > /.buildstamp <<EOF
#[Main]
#IsFinal=true
#EOF



echo "DevNix" > /etc/system-release
# echo "DevNix" > /etc/issue
# sed -i s/Fedora/DevNix/g /etc/issue

# /usr/share/doc/generic-release-notes
# /usr/share/doc/generic-release-notes/README.Generic-Release-Notes
mkdir -p /usr/share/licenses/devnix-release
cat > /usr/share/licenses/devnix-release/README.md <<EOF
# DevNix Release Information

## Website

https://www.devdungeon.com/devnix

## Contact

nanodano@devdungeon.com

EOF

# https://www.freedesktop.org/software/systemd/man/os-release.html
cat > /usr/lib/os-release <<FOE
NAME=DevNix
VERSION="30 (Workstation Edition)"
ID=devnix
VERSION_ID=30
OS=DevNix
VER=30
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
DevNix release 30
FOE

# Installer related packages
# anaconda
# anaconda-install-env-deps
# anaconda-live
# @anaconda-tool
# initial-setup

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

sed -i "s/@define-color product_bg_color @fedora;/@define-color product_bg_color \#222222;/" /usr/share/anaconda/anaconda-gtk.css

# Change the name in the installer popup
sed -i s/Fedora/DevNix/g $INSTALL_ROOT/usr/share/anaconda/gnome/fedora-welcome
sed -i s/Fedora/DevNix/g $INSTALL_ROOT/usr/share/anaconda/gnome/fedora-welcome.desktop


#####################
## Installer Icons ##
#####################

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

cp resources/icons/devnix-lettermark-128.png $INSTALL_ROOT/usr/share/pixmaps/fedora-logo-small.png

rm $INSTALL_ROOT/usr/share/icons/hicolor/scalable/apps/anaconda.svg

gtk-update-icon-cache $INSTALL_ROOT/usr/share/icons/hicolor


##############
## SSH MOTD ##
##############

cat > $INSTALL_ROOT/etc/motd <<EOF
 ____             _   _ _      
|  _ \  _____   _| \ | (_)_  __
| | | |/ _ \ \ / /  \| | \ \/ /
| |_| |  __/\ V /| |\  | |>  < 
|____/ \___| \_/ |_| \_|_/_/\_\
                               
Welcome to DevNix. Visit https://www.devdungeon.com/devnix for help.
EOF

%end
