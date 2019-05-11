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

## Copy over files that will be needed
cp resources/softlib/jetbrains-toolbox-1.14.5179.tar.gz $INSTALL_ROOT/
cp resources/softlib/code-1.33.1-1554971173.el7.x86_64.rpm $INSTALL_ROOT/

## Store sources for building images
cp resources/dist_keys/git_deploy_key $INSTALL_ROOT/root/.ssh/id_rsa
git clone git@github.com:NanoDano/DevNix $INSTALL_ROOT/usr/src/DevNix

## Gecko driver for Firefox and Selenium
tar xzf resources/softlib/geckodriver-v0.24.0-linux64.tar.gz
mv geckodriver $INSTALL_ROOT/usr/bin/

%end



%post --erroronfail

## Change default shell
sed -i "s/\/bin\/bash/\/bin\/zsh/" /etc/default/useradd

## Install VSCode
#rpm --import https://packages.microsoft.com/keys/microsoft.asc
#sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
#dnf check-update
#dnf install code
cd /
yum install code-1.33.1-1554971173.el7.x86_64.rpm
rm code-1.33.1-1554971173.el7.x86_64.rpm

## JetBrains Toolbox
cd /
tar xzf jetbrains-toolbox-1.14.5179.tar.gz
./jetbrains-toolbox-1.14.5179/jetbrains-toolbox
rm -rf jetbrains-toolbox-1.14.5179

%end


