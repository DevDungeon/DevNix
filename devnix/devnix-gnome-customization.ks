%packages

gnome-shell-extension-dash-to-dock
gnome-tweak-tool
dconf-editor

%end





%post  --erroronfail

#################################
## Add nautilus/file bookmarks ##
#################################

mkdir -p /etc/skel/.config/gtk-3.0
cat > /etc/skel/.config/gtk-3.0/bookmarks <<EOF
file:/// /
file:///etc/ /etc/
file:///var/log/ /var/log/
file:///usr/src/ /usr/src/
file:///usr/share/doc/ /usr/share/doc
EOF


###########################
## Application favorites ##
###########################

# https://help.gnome.org/admin/system-admin-guide/stable/desktop-favorite-applications.html.en
cat > /etc/dconf/db/local.d/00-favorite-apps <<FOE
[org/gnome/shell]
favorite-apps=['firefox.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'anaconda.desktop']
FOE

## Extensions
# https://help.gnome.org/admin/system-admin-guide/stable/extensions-enable.html.en
cat > /etc/dconf/db/local.d/00-extensions <<FOE
[org/gnome/shell]
enabled-extensions=['places-menu@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com', 'background-logo@fedorahosted.org']
FOE

## Background logo extension (background-logo@fedorahosted.org)
[org/fedorahosted/background-logo-extension]
logo-always-visible=true
logo-border=20
logo-file='/usr/local/share/devnix/logos/devnix_800px.png'
logo-size=7


#################
## Keymappings ##
#################

cat > /etc/dconf/db/local.d/00-keymaps <<FOE
[org/gnome/desktop/input-sources]
xkb-options=['caps:escape']
FOE


#######################
## Other preferences ##
#######################

cat > /etc/dconf/db/local.d/00-misc <<FOE

## Gnome terminal

[org/gnome/terminal/legacy]
default-show-menubar=false

[org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
background-color='#222222'
bold-color='rgb(30,150,150)'
bold-color-same-as-fg=false
bold-is-bright=true
cursor-background-color='rgb(200, 25, 200)'
cursor-colors-set=true
delete-binding='ascii-delete'
foreground-color='rgb(0,255,255)'
highlight-background-color='rgb(26,157,157)'
highlight-colors-set=true
highlight-foreground-color='rgb(20,53,50)'
palette=['rgb(46,52,54)', 'rgb(204,0,0)', 'rgb(20,255,0)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(30,93,94)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(0,135,135)', 'rgb(255,255,0)']
scrollback-unlimited=true
use-theme-colors=false

[org/gnome/desktop/interface]
gtk-theme='Adwaita-dark'
icon-theme='breeze-dark'


## Nautilus

[org/gnome/nautilus/icon-view]
default-zoom-level='small'
captions=['size', 'none', 'none']

[org/gnome/nautilus/list-view]
default-zoom-level='small'
use-tree-view=true

[org/gnome/nautilus/preferences]
default-folder-viewer='list-view'
executable-text-activation='ask'
click-policy='single'
show-delete-permanently=true

[org/gtk/settings/file-chooser]
show-hidden=true
sort-directories-first=true

## Misc

[org/gnome/desktop/interface]
clock-format='12h'
clock-show-weekday=true

[org/gnome/desktop/wm/preferences]
action-middle-click-titlebar='minimize'

[org/gnome/shell/extensions/dash-to-dock]
extend-height=true
dock-fixed=true

## Application folders
[org/gnome/desktop/app-folders]
folder-children=['Utilities', 'Office', 'Terminal', 'Web', 'Editors', 'Image']
name='Office'

[org/gnome/desktop/app-folders/folders/Office]
apps=['libreoffice-writer.desktop', 'libreoffice-calc.desktop', 'libreoffice-draw.desktop', 'libreoffice-impress.desktop', 'gnome-contacts.desktop', 'org.gnome.Calendar.desktop']
name='Office'

[org/gnome/desktop/app-folders/folders/Terminal]
apps=['gnome-termina', 'neovim.desktop', 'gvim.desktop', 'vifm.desktop', 'links.desktop']
name='Terminal'

[org/gnome/desktop/app-folders/folders/Web]
apps=['firefox.desktop', 'chromium.desktop', 'thunderbird.desktop', 'filezilla.desktop']
name='Web'

[org/gnome/desktop/app-folders/folders/Editors]
apps=['gedit.desktop', 'gvim.desktop', 'nvim.desktop']
name='Editors'

[org/gnome/desktop/app-folders/folders/Image]
apps=['eog.desktop', 'org.kde.kolourpaint.desktop', 'gimp.desktop', 'gnome-photos.desktop', 'libreoffice-draw']
name='Image'

# Electronics group
# Settings
# virtualization



FOE

# Commit all dconf changes
dconf update

%end
