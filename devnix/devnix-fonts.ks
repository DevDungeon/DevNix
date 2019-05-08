%post --nochroot --erroronfail

# Hack font
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
rm Hack-v3.003-ttf.zip
mv ttf $INSTALL_ROOT/usr/share/fonts/hack

# Ubuntu font
wget https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip
unzip fad7939b-ubuntu-font-family-0.83.zip
rm fad7939b-ubuntu-font-family-0.83.zip
mv ubuntu-font-family-0.83 $INSTALL_ROOT/usr/share/fonts

%end


%post --erroronfail

# Flush font cache
fc-cache -fv

%end
