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


%post

echo "DevNix" > /etc/system-release
#echo "DevNix" > /etc/issue

# /usr/share/doc/generic-release-notes
# /usr/share/doc/generic-release-notes/README.Generic-Release-Notes
mkdir -p /usr/share/licenses/devnix-release
cat > /usr/share/licenses/devnix-release/README.md <<EOF
# DevNix Release Information

## Contact

nanodano@devdungeon.com

EOF


cat > /usr/lib/os-release <<FOE
NAME=DevNix
VERSION="1 (Workstation Edition)"
ID=devnix
VERSION_ID=1
VERSION_CODENAME="alpha"
PLATFORM_ID="platform:f30"
PRETTY_NAME="DevNix Workstation"
ANSI_COLOR="0;34"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora:30"
HOME_URL="https://www.devdungeon.com/devnix"
DOCUMENTATION_URL="https://www.devdungeon.com/devnix"
SUPPORT_URL="https://fedoraproject.org/wiki/Communicating_and_getting_help"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=30
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=30
PRIVACY_POLICY_URL="https://fedoraproject.org/wiki/Legal:PrivacyPolicy"
VARIANT="Workstation Edition"
VARIANT_ID=workstation
FOE



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

mkdir -p $INSTALL_ROOT/usr/share/anaconda/boot
cp resources/anaconda/splash.png $INSTALL_ROOT/usr/share/anaconda/boot/splash.png
cp resources/anaconda/syslinux-splash.png $INSTALL_ROOT/usr/share/anaconda/boot/syslinux-splash.png

mkdir -p $INSTALL_ROOT/usr/share/anaconda/pixmaps
cp resources/anaconda/anaconda_header.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/anaconda_header.png
cp resources/anaconda/progress_first.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/progress_first.png
cp resources/anaconda/sidebar-bg.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/sidebar-bg.png
cp resources/anaconda/sidebar-logo.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/sidebar-logo.png
cp resources/anaconda/splash.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/splash.png
cp resources/anaconda/topbar-bg.png $INSTALL_ROOT/usr/share/anaconda/pixmaps/topbar-bg.png

mkdir -p $INSTALL_ROOT/usr/share/firstboot/themes/generic
cp resources/first_boot/themes/devnix/firstboot-left.png $INSTALL_ROOT/usr/share/firstboot/themes/generic
cp resources/first_boot/themes/devnix/workstation.png $INSTALL_ROOT/usr/share/firstboot/themes/generic

%end