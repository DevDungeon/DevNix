%include ../fedora-live-workstation.ks
%include devnix-packages.ks
%include devnix-fonts.ks

# Override disk size in fedora-live-workstation.ks so it
# has enough room to build. Does not indicate size of final iso
part / --size 9656






%post --erroronfail


## Docker
# yum -y install docker
# systemctl start docker
# groupadd docker
# chown root:docker /var/run/docker.sock
# docker pull alpine
# systemctl stop docker

## Change default shell
sed -i "s/\/bin\/bash/\/bin\/zsh/" /etc/default/useradd

# Common packages for programming languages
#npm install -g typescript nativescript @angular/cli yarn tslint electron express
#yum install python3-pip pyhon3-venv python3-paramiko python3-... flask django gtk pygobject
#gem install bundler


# Set /etc/system-release to DevNix name to replace fedora
# Change icon https://bugzilla.redhat.com/show_bug.cgi?id=464120


%end





%post --nochroot --erroronfail

# Add .vimrc, .zshrc, .zshrc.local, and .ssh/config in all user home dirs

# cat resources/vimrc >> /etc/vimrc
# cat resources/zshrc >> /etc/zshrc
# cat resources/ssh_config >> /etc/ssh_config
cp resources/vimrc $INSTALL_ROOT/etc/skel/.vimrc
cp resources/zshrc $INSTALL_ROOT/etc/skel/.zshrc
cp resources/ssh_config $INSTALL_ROOT/etc/skel/.ssh/config
#chmod on .ssh folder



%end

