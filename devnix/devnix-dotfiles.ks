%post --nochroot --erroronfail

# Add .vimrc, .zshrc, .zshrc.local, and .ssh/config in all user home dirs
cp resources/vimrc $INSTALL_ROOT/etc/skel/.vimrc
cp resources/zshrc $INSTALL_ROOT/etc/skel/.zshrc
touch $INSTALL_ROOT/etc/skel/.zshrc.local
mkdir -p $INSTALL_ROOT/etc/skel/.ssh/
chmod -R 700 $INSTALL_ROOT/etc/skel/.ssh
cp resources/ssh_config $INSTALL_ROOT/etc/skel/.ssh/config
chmod 600 $INSTALL_ROOT/etc/skel/.ssh/config

# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh $INSTALL_ROOT/etc/skel/.oh-my-zsh

%end
