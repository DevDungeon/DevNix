%packages

gnome-tweak-tool
gnome-shell-extension-dash-to-dock
dconf-editor

%end





%post  --erroronfail

## Add nautilus/file bookmarks
mkdir -p /etc/skel/.config/gtk-3.0
cat > /etc/skel/.config/gtk-3.0/bookmarks <<EOF
file:/// /
EOF

## Application favorites
# https://help.gnome.org/admin/system-admin-guide/stable/desktop-favorite-applications.html.en
cat > /etc/dconf/db/local.d/00-favorite-apps <<FOE
[org/gnome/shell]
favorite-apps=['firefox.desktop', 'org.gnome.Terminal.desktop', 'anaconda.desktop']
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



## CAPS LOCK -> ESC key mapping
cat > /etc/dconf/db/local.d/00-keymaps <<FOE
[org/gnome/desktop/input-sources]
xkb-options=['caps:escape']
FOE

## Other preferences
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

## World Clocks
#[org/gnome/clocks]
#world-clocks=[{'location': <(uint32 2, <('San Francisco', 'KOAK', true, [(0.65832848982162007, -2.133408063190589)], [(0.659296885757089, -2.1366218601153339)])>)>}, {'location': <(uint32 2, <('Houston', 'KHOU', true, [(0.51727195705981943, -1.6629933445314968)], [(0.51946730200614799, -1.6644030644216252)])>)>}, {'location': <(uint32 2, <('New York', 'KNYC', true, [(0.71180344078725644, -1.2909618758762367)], [(0.71059804659265924, -1.2916478949920254)])>)>}, {'location': <(uint32 2, <('London', 'EGWU', true, [(0.89971722940307675, -0.007272211034407213)], [(0.89884456477707964, -0.0020362232784242244)])>)>}, {'location': <(uint32 2, <('Moscow', 'UUWW', true, [(0.97127572873484425, 0.65042604039431762)], [(0.97305983920281813, 0.65651530216830811)])>)>}, {'location': <(uint32 2, <('Hong Kong', 'VHHH', true, [(0.38979019379430269, 1.9928751117510946)], [(0.38949931722116538, 1.9928751117510946)])>)>}, {'location': <(uint32 2, <('Sydney', 'YSSY', true, [(-0.59253928105207498, 2.6386469349889961)], [(-0.59137572239964786, 2.6392287230418559)])>)>}]

## Nautilus file icon sizes
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
