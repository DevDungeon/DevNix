# fedora-livedvd-games-nl_NL.ks
#
# Maintainer(s):
# - Jeroen van Meeuwen <kanarip a fedoraunity.org>

%include ../fedora-livedvd-games.ks

lang nl_NL
keyboard us
timezone Europe/Amsterdam

%packages
langpacks-nl
# exclude input methods
-m17n*
-scim*
%end
