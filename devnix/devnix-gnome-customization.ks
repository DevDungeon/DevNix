%packages

gnome-tweak-tool
gnome-shell-extension-dash-to-dock

%end


%post --nochroot --erroronfail

# Copy wallpaper over
mkdir -p $INSTALL_ROOT/usr/local/share/backgrounds
cp resources/wallpaper.png $INSTALL_ROOT/usr/local/share/backgrounds/wallpaper.png

%end


%post  --erroronfail


## Application favorites
# https://help.gnome.org/admin/system-admin-guide/stable/desktop-favorite-applications.html.en
cat > /etc/dconf/db/local.d/00-favorite-apps <<FOE
[org/gnome/shell]
favorite-apps = ['gedit.desktop', 'gnome-terminal.desktop', 'firefox.desktop', 'nautilus.desktop']
FOE
#dconf update # not needed?
# Alternatively, put in /etc/skel/.config/dconf/user


## Extensions
# https://help.gnome.org/admin/system-admin-guide/stable/extensions-enable.html.en
cat > /etc/dconf/db/local.d/00-extensions <<FOE
[org/gnome/shell]
enabled-extensions=['places-menu@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com']
FOE
# TODO include gnome-shell-extension-dash-to-dock as turned on
# dconf read /org/gnome/shell/enabled-extensions

## CAPS LOCK -> ESC key mapping
cat > /etc/dconf/db/local.d/00-keymaps <<FOE
[org/gnome/desktop/input-sources]
xkb-options=['caps:escape']
FOE

## Set wallpaper
# https://help.gnome.org/admin/system-admin-guide/stable/desktop-background.html.en
cat > /etc/dconf/db/local.d/00-wallpaper<<FOE
[org/gnome/desktop/background]
picture-uri='file:///usr/local/share/backgrounds/wallpaper.png'
picture-options='scaled'
primary-color='000000'
secondary-color='333333'
FOE


%end
