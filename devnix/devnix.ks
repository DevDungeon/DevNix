%include ../fedora-live-workstation.ks

%include devnix-packages.ks

%include devnix-python.ks
%include devnix-nodejs.ks
%include devnix-ruby.ks
%include devnix-java.ks
%include devnix-php.ks
%include devnix-golang.ks

%include devnix-dotfiles.ks
%include devnix-fonts.ks
%include devnix-gnome-customization.ks
%include devnix-branding.ks


# Override disk size in fedora-live-workstation.ks so it
# has enough room to build. Does not indicate size of final iso
part / --size 15000


%post --nochroot --erroronfail

## Store sources for building images
git clone git@github.com:NanoDano/DevNix $INSTALL_ROOT/usr/src/DevNix
cp resources/dist_keys/git_deploy_key $INSTALL_ROOT/usr/src/DevNix/id_rsa_deploy_key

## Gecko driver for Firefox and Selenium
tar xzf resources/softlib/geckodriver-v0.24.0-linux64.tar.gz
mv geckodriver $INSTALL_ROOT/usr/bin/

%end





%post --erroronfail

## Append the live system config to override the part in
## fedora-live-workstation.ks where it disables the
## spokes that ask for password and user.
## By setting all the spokes visited to 0, it will
## create the user during the install, and the gnome-initial-setup
## will only run for the user and not when gdm loads

cat >> /etc/rc.d/init.d/livesys << EOF

# Unsuppress anaconda spokes redundant with gnome-initial-setup
cat > /etc/sysconfig/anaconda << FOE
[NetworkSpoke]
visited=0
[PasswordSpoke]
visited=0
[UserSpoke]
visited=0
FOE

EOF

#################################
## Change default shell to zsh ##
#################################

sed -i "s/\/bin\/bash/\/bin\/zsh/" /etc/default/useradd


%end


