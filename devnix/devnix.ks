%include ../fedora-live-workstation.ks

%include devnix-packages.ks
%include devnix-dotfiles.ks
%include devnix-branding.ks
%include devnix-gnome-customization.ks
%include devnix-fonts.ks
#%include devnix-extra-software.ks


###################################################################
## Override disk size in fedora-live-workstation.ks so it        ## 
## has enough room to build. Does not indicate size of final iso ##
###################################################################

part / --size 19750



%post --nochroot --erroronfail


###########################################
## Gecko driver for Firefox and Selenium ##
###########################################

wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
tar xzf geckodriver-v0.24.0-linux64.tar.gz
rm geckodriver-v0.24.0-linux64.tar.gz
mv geckodriver $INSTALL_ROOT/usr/bin/


##############
## PHP Docs ##
##############

wget https://www.php.net/distributions/manual/php_manual_en.tar.gz
tar xzf php_manual_en.tar.gz -C $INSTALL_ROOT/usr/share/doc


#######################################
## Store sources for building images ##
#######################################

git clone --branch f30 https://github.com/DevDungeon/DevNix $INSTALL_ROOT/usr/src/DevNix


#######################################
## Clone all DevDungeon github repos ##
#######################################

mkdir -p $INSTALL_ROOT/usr/src/DevDungeon/
for reponame in $(cat resources/devdungeon-repos.txt)
do
  git clone https://github.com/DevDungeon/$reponame $INSTALL_ROOT/usr/src/DevDungeon/$reponame
done


################
## Zsh prompt ##
################

cp resources/prompt_devnix_setup $INSTALL_ROOT/usr/share/zsh/site-functions/

%end





%post --erroronfail

#################################
## Change default shell to zsh ##
#################################

sed -i "s/\/bin\/bash/\/bin\/zsh/" /etc/default/useradd


######################
## Sudo no password ##
######################

cp /etc/sudoers /etc/sudoers.temp
sed -i "s/^%wheel/\#%wheel/" /etc/sudoers.temp
sed -i "s/\# %wheel/%wheel/" /etc/sudoers.temp
mv /etc/sudoers.temp /etc/sudoers -f


%end