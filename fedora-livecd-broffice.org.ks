# fedora-livecd-broffice.ks
#
# Maintainer(s):
# - Igor Pires Soares <igor at projetofedora.org>


%include fedora-livecd-desktop.ks

lang pt_BR.UTF-8
keyboard br-abnt2
timezone America/Sao_Paulo

%packages
@brazilian-support
hunspell-pt


# To avoid double functionality we will drop abiword and gnumeric and put BrOffice.org in
-abiword
-gnumeric
-gimp-*
broffice.org-writer
broffice.org-math
broffice.org-impress
broffice.org-draw


# We won't use these Asiatic fonts anyway
-lklug-fonts
-abyssinica-fonts
-jomolhari-fonts
-lohit-fonts-*
-thaifonts-scalable
-kacst-fonts
-paktype-fonts
-baekmuk-*
-cjkunifonts-*
-VLGothic-fonts


# Saving space in order to get BrOffice.org in
-gnome-utils
-gnome-games-*
-planner
-scim-python*
-scim-chewing
-scim-pinyin
-dasher
-system-config-language
-evince-dvi
-evince-djvu
-ekiga
-f-spot
-cheese
-sound-juicer

%end


%post

# system-config-keyboard doesn't really work (missing xorg.conf etc)
cat >>/etc/X11/xorg.conf << EOF
Section "InputDevice"
    Identifier "Keyboard0"
    Driver "kbd"
    Option "XkbLayout" "br-abnt2"
EndSection
EOF

%end