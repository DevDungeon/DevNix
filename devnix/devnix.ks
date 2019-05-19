%include ../fedora-live-workstation.ks

%include devnix-packages.ks
%include devnix-dotfiles.ks
%include devnix-branding.ks
%include devnix-gnome-customization.ks


# These could use some better packaging and updating
%include devnix-fonts.ks
#%include devnix-extra-software.ks


# Override disk size in fedora-live-workstation.ks so it
# has enough room to build. Does not indicate size of final iso
#part / --size 18650 # minimum as of delta6
part / --size 19000



%post --nochroot --erroronfail

## Store sources for building images
git clone --branch f30 git@github.com:NanoDano/DevNix $INSTALL_ROOT/usr/src/DevNix
cp resources/dist_keys/git_deploy_key $INSTALL_ROOT/usr/src/DevNix/id_rsa_deploy_key

## Gecko driver for Firefox and Selenium
tar xzf resources/softlib/geckodriver-v0.24.0-linux64.tar.gz
mv geckodriver $INSTALL_ROOT/usr/bin/

%end





%post --erroronfail

#################################
## Change default shell to zsh ##
#################################

sed -i "s/\/bin\/bash/\/bin\/zsh/" /etc/default/useradd


%end


