%post
# pygtk/pygobject/paramiko

# change screensaver
# change login screen image
[org/gnome/desktop/screensaver]
picture-uri='file:///path/to/some_image.jpg'
Also note that the path needs to be readable by the gdm user.
In Fedora 21 gdm will change slightly so there will be an additional step for this to work:
create /etc/dconf/profile/gdm with the following content:
user-db:user
file-db:/usr/share/gdm/greeter-dconf-defaults
system-db:gdm


# Application Icons

# Remove any apps I don't like
#-weather
#-simplescan

# how to regroup the application list? or put more stuff under /utility group?

# Change which ones show up under Utility group


# Change default favorites on docker

# Gnome tweak changes


# Include Java 11, but set 8 as default?



# setup vscode from source

# setup jetbrains from source


# Customize firefox/chromium bookmarks

# is qemu/qemu-kvm/virt-manager necessary?






# Set world clocks


# Fish shell too?

# Change default shel to zsh
# https://askubuntu.com/questions/28969/how-do-you-change-the-default-shell-for-all-users-to-bash



# roll in security spin packges?

# Add /etc/devnix-release just like /etc/fedora-release


# Add TypeScript globally


# Create yum packages/repos for vscode, jetbrains, github desktop?