%post --nochroot

mkdir -p $INSTALL_ROOT/usr/local/share/backgrounds
cp resources/wallpaper.png $INSTALL_ROOT/usr/local/share/backgrounds/wallpaper.png


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






cat > /etc/dconf/db/local.d/00-devnix <<FOE

################
## Extensions ##
################

# https://help.gnome.org/admin/system-admin-guide/stable/extensions-enable.html.en

[org/gnome/shell]
enabled-extensions=['places-menu@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com', 'background-logo@fedorahosted.org']

## Background logo extension (background-logo@fedorahosted.org)
[org/fedorahosted/background-logo-extension]
logo-always-visible=true
logo-border=20
logo-file='/usr/local/share/devnix/logos/devnix_800px.png'
logo-size=10


#################
## Keymappings ##
#################

[org/gnome/desktop/input-sources]
xkb-options=['caps:escape']


#################
## Backgrounds ##
#################

# https://help.gnome.org/admin/system-admin-guide/stable/desktop-background.html.en

[org/gnome/desktop/background]
picture-uri='file:///usr/local/share/backgrounds/wallpaper.png'
picture-options='stretched'
primary-color='000000'
secondary-color='333333'

[org/gnome/login-screen]
logo='/usr/local/share/devnix/logos/devnix_800px.png'

[org/gnome/desktop/screensaver]
picture-uri='file:///usr/local/share/backgrounds/wallpaper.png'



####################
## Gnome terminal ##
####################

[org/gnome/terminal/legacy]
default-show-menubar=false

[org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
highlight-colors-set=true
scrollback-unlimited=true
cursor-colors-set=true
delete-binding='ascii-delete'
bold-color-same-as-fg=false
bold-is-bright=true
use-theme-colors=false
background-color='#222222'
bold-color='rgb(30,150,150)'
foreground-color='rgb(0,255,255)'
cursor-background-color='rgb(200, 25, 200)'
highlight-background-color='rgb(26,157,157)'
highlight-foreground-color='rgb(20,53,50)'
palette=['rgb(46,52,54)', 'rgb(204,0,0)', 'rgb(20,255,0)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(30,93,94)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(0,135,135)', 'rgb(255,255,0)']


#[org/gnome/desktop/interface]
#gtk-theme='Adwaita-dark'
#icon-theme='breeze-dark'


##############
## Nautilus ##
##############

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


###########
## Gedit ##
###########

[org/gnome/gedit/preferences/ui]
side-panel-visible=true

[org/gnome/gedit/preferences/editor]
auto-indent=true
bracket-matching=true
display-line-numbers=true
display-overview-map=true
editor-font='Hack 11'
highlight-current-line=true
insert-spaces=true
scheme='cobalt'
tabs-size=4
use-default-font=false

[org/gnome/gedit/plugins]
active-plugins=['docinfo', 'modelines', 'filebrowser', 'time', 'externaltools', 'quickhighlight']

[org/gnome/gedit/plugins/filebrowser]
filter-mode=['']

#############
## Desktop ##
#############

[org/gnome/desktop/interface]
clock-format='12h'
clock-show-weekday=true

[org/gnome/desktop/wm/preferences]
action-middle-click-titlebar='minimize'

[org/gnome/shell/extensions/dash-to-dock]
extend-height=true
dock-fixed=true



###########################
## Application favorites ##
###########################

[org/gnome/shell]
favorite-apps=['firefox.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.gedit.desktop', 'anaconda.desktop']


#########################
## Application folders ##
#########################

[org/gnome/desktop/app-folders]
folder-children=['Utilities', 'Office', 'Terminal', 'Web', 'Editors', 'Graphics', 'Development', 'Audio', 'Security', 'Electronics', 'Virtualization', 'Disks']

[org/gnome/desktop/app-folders/folders/Office]
name='Office'
apps=['libreoffice-writer.desktop', 'libreoffice-calc.desktop', 'libreoffice-draw.desktop', 'libreoffice-impress.desktop', 'org.gnome.Contacts.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Evolution.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Calendar.desktop', 'org.gnome.Evince.desktop', 'org.gnome.Maps.desktop', 'org.gnome.Weather.desktop', 'org.gnome.clocks.desktop']

[org/gnome/desktop/app-folders/folders/Utilities]
name='Utilities'
apps=['gnome-system-monitor.desktop', 'org.gnome.Characters.desktop', 'org.gnome.Screenshot.desktop', 'keepass.desktop', 'org.gnome.tweaks.desktop', 'simple-scan.desktop', 'ca.desrt.dconf-editor.desktop', 'org.gnome.font-viewer.desktop', 'nm-connection-editor.desktop', 'yelp.desktop', 'org.gnome.Logs.desktop', 'gnome-abrt.desktop', 'gnome-control-center.desktop', 'org.gnome.FileRoller.desktop', 'mediawriter.desktop', 'org.kde.kgpg.desktop', 'htop.desktop', 'transmission-gtk.desktop', 'org.kde.ktorrent.desktop']

[org/gnome/desktop/app-folders/folders/Terminal]
name='Terminal'
apps=['org.gnome.Terminal.desktop', 'nvim.desktop', 'gvim.desktop', 'links.desktop', 'vifm.desktop', 'lftp.desktop', 'xterm.desktop']
#rtorrent
#irssi

[org/gnome/desktop/app-folders/folders/Web]
name='Web'
apps=['firefox.desktop', 'chromium-browser.desktop', 'filezilla.desktop', 'org.gnome.Evolution.desktop', 'links.desktop', 'pidgin.desktop', 'lftp.desktop']
##rtorrent
#irssi

[org/gnome/desktop/app-folders/folders/Editors]
name='Editors/IDE'
apps=['org.gnome.gedit.desktop', 'gvim.desktop', 'nvim.desktop', 'emacs.desktop', 'godot.desktop', 'org.gnome.Builder.desktop', 'cc.arduino.arduinoide.desktop', 'codeblocks.desktop', 'eclipse.desktop', 'idle3.desktop', 'org.kde.kate.desktop', 'code.desktop', 'monodevelop.desktop', 'gambas3.desktop', 'atom.desktop', 'netbeans.desktop']
#netbeans

[org/gnome/desktop/app-folders/folders/Graphics]
name='Graphics'
apps=['blender.desktop', 'inkscape.desktop', 'eog.desktop', 'org.kde.kolourpaint.desktop', 'gimp.desktop', 'org.gnome.Photos.desktop', 'libreoffice-draw', 'org.gnome.Totem.desktop', 'org.gnome.Cheese.desktop']

[org/gnome/desktop/app-folders/folders/Development]
name='Development'
apps=['gitg.desktop', 'glade-3.desktop', 'idle3.desktop', 'gradle.desktop', 'nemiver.desktop', 'org.gnome.meld.desktop', 'manedit.desktop', 'manview.desktop', 'java-1.8.0-openjdk-1.8.0.212.b04-0.fc30.x86_64-jconsole.desktop', 'java-1.8.0-openjdk-1.8.0.212.b04-0.fc30.x86_64-policytool.desktop', 'qt5-designer.desktop', 'qt5-qdbusviewer.desktop', 'qt5-linguist.desktop']

# docs
# repls
#irb
#bpython-urwid
#gdb
#mpg123

[org/gnome/desktop/app-folders/folders/Audio]
name='Audio'
apps=['audacity.desktop', 'rhythmbox.desktop', 'ardour5.desktop']

[org/gnome/desktop/app-folders/folders/Electronics]
name='Electronics'
apps=['cc.arduino.arduinoide.desktop', 'fritzing.desktop']

[org/gnome/desktop/app-folders/folders/Virtualization]
name='Virtualization'
apps=['org.gnome.Boxes.desktop', 'virt-manager.desktop']

[org/gnome/desktop/app-folders/folders/Disks]
name='Disks'
apps=['gparted.desktop', 'blivet-gui.desktop', 'org.gnome.DiskUtility.desktop', 'org.gnome.baobab.desktop', 'vifm.desktop', 'org.gnome.Nautilus.desktop']

[org/gnome/desktop/app-folders/folders/Security]
name='Security'
apps=['wireshark.desktop']
#nmap
#zap
#hashcat


# Databases
#sqlitebrowser.desktop
#mysql.desktop (right
#postgres.desktop (right click -> start service/stop service/launch client)
#derby (right click start/stop)
# mysql workbench
#DataGrip


# Web servers
# nginx start/stop/logs/config/
# tomcat start/stop/logs/config/
# apache httpd start/stop/logs/config
# uwsgi start/stop/logs/config
# Places->/var/www


FOE

# Commit all dconf changes
dconf update

%end
