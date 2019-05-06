%include ../fedora-live-workstation.ks

%include devnix-packages.ks
%include devnix-dotfiles.ks
%include devnix-fonts.ks
%include devnix-branding.ks
%include devnix-gnome-customization.ks

# Override disk size in fedora-live-workstation.ks so it
# has enough room to build. Does not indicate size of final iso
part / --size 12000

reboot --eject
firstboot --enable --reconfig

%post --erroronfail

## Change default shell
#sed -i "s/\/bin\/bash/\/bin\/zsh/" /etc/default/useradd

%end


%post --nochroot --erroronfail

# Copy entire contents of build scripts over for debug
#mkdir -p $INSTALL_ROOT/opt/devnix-build
#cp *.ks $INSTALL_ROOT/opt/devnix-build

%end

