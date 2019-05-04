%include ../fedora-live-workstation.ks
#%include devnix-packages.ks
#%include devnix-fonts.ks
%include devnix-branding.ks

# Override disk size in fedora-live-workstation.ks so it
# has enough room to build. Does not indicate size of final iso
part / --size 12000






%post --erroronfail


## Docker
# yum -y install docker
# systemctl start docker
# groupadd docker
# chown root:docker /var/run/docker.sock
# docker pull alpine
# systemctl stop docker

## Change default shell
sed -i "s/\/bin\/bash/\/bin\/zsh/" /etc/default/useradd

# Common packages for programming languages
#npm install -g typescript nativescript @angular/cli yarn tslint electron express
#yum install python3-pip pyhon3-venv python3-paramiko python3-... flask django gtk pygobject
#gem install bundler


# Set /etc/system-release to DevNix name to replace fedora
# Change icon https://bugzilla.redhat.com/show_bug.cgi?id=464120

# Set Gnome app favorites on dock
# https://help.gnome.org/admin/system-admin-guide/stable/desktop-favorite-applications.html.en
cat > /etc/dconf/db/local.d/00-favorite-apps <<FOE
[org/gnome/shell]
favorite-apps = ['gedit.desktop', 'gnome-terminal.desktop', 'firefox.desktop', 'nautilus.desktop']
FOE
#dconf update # not needed?
# Alternatively, put in /etc/skel/.config/dconf/user


# turn on gnome extensions
# https://help.gnome.org/admin/system-admin-guide/stable/extensions-enable.html.en
cat > /etc/dconf/db/local.d/00-extensions <<FOE
[org/gnome/shell]
enabled-extensions=[['places-menu@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com']
FOE
# TODO include gnome-shell-extension-dash-to-dock as turned on
# dconf read /org/gnome/shell/enabled-extensions

## Set up Gnome caps -> Escape mapping
cat > /etc/dconf/db/local.d/00-keymaps <<FOE
[org/gnome/desktop/input-sources]
xkb-options=['caps:escape']
FOE

# Set custom background
# https://help.gnome.org/admin/system-admin-guide/stable/desktop-background.html.en
cat > /etc/dconf/db/local.d/00-wallpaper<<FOE
[org/gnome/desktop/background]
picture-uri='file:///usr/local/share/backgrounds/wallpaper.png'
picture-options='scaled'
primary-color='000000'
secondary-color='333333'
FOE

%end


%post --nochroot --erroronfail

# Add in the wallpaper needed that was set in the previous section
mkdir -p $INSTALL_ROOT/usr/local/share/backgrounds
cp resources/wallpaper.png $INSTALL_ROOT/usr/local/share/backgrounds/wallpaper.png

# Add .vimrc, .zshrc, .zshrc.local, and .ssh/config in all user home dirs

# cat resources/vimrc >> /etc/vimrc
# cat resources/zshrc >> /etc/zshrc
# cat resources/ssh_config >> /etc/ssh_config
cp resources/vimrc $INSTALL_ROOT/etc/skel/.vimrc
cp resources/zshrc $INSTALL_ROOT/etc/skel/.zshrc
touch $INSTALL_ROOT/.zshrc.local
mkdir -p $INSTALL_ROOT/etc/skel/.ssh/
chmod -R 700 $INSTALL_ROOT/etc/skel/.ssh
cp resources/ssh_config $INSTALL_ROOT/etc/skel/.ssh/config
chmod 600 $INSTALL_ROOT/etc/skel/.ssh/config


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
cp resources/first_boot/firstboot-left.png $INSTALL_ROOT/usr/share/firstboot/themes/generic
cp resources/first_boot/workstation.png $INSTALL_ROOT/usr/share/firstboot/themes/generic

%end

