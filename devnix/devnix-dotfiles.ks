%post --nochroot --erroronfail

# Vimrc
cp resources/skel/vimrc $INSTALL_ROOT/etc/skel/.vimrc

# Zshrc
cp resources/skel/zshrc $INSTALL_ROOT/etc/skel/.zshrc
touch $INSTALL_ROOT/etc/skel/.zshrc.local

# SSH
mkdir -p $INSTALL_ROOT/etc/skel/.ssh/
chmod -R 700 $INSTALL_ROOT/etc/skel/.ssh
cp resources/skel/ssh_config $INSTALL_ROOT/etc/skel/.ssh/config
chmod 600 $INSTALL_ROOT/etc/skel/.ssh/config

# Python pypi
cp resources/skel/pypirc $INSTALL_ROOT/etc/skel/.pypirc

# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh $INSTALL_ROOT/etc/skel/.oh-my-zsh

%end

