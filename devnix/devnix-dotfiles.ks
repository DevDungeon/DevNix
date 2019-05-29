%post --nochroot --erroronfail

## Copy dotfiles/home dir skeleton over
cp -r resources/skel/ $INSTALL_ROOT/etc/

## SSH config permissions
chmod -R 700 $INSTALL_ROOT/etc/skel/.ssh
chmod 600 $INSTALL_ROOT/etc/skel/.ssh/config


%end

