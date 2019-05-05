%include ../fedora-live-workstation.ks
%include devnix-packages.ks
%include devnix-gnome-customization.ks
%include devnix-dotfiles.ks
%include devnix-fonts.ks
%include devnix-branding.ks

# Override disk size in fedora-live-workstation.ks so it
# has enough room to build. Does not indicate size of final iso
part / --size 12000


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

%end


%post --nochroot --erroronfail


%end

