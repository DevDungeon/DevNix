%packages

python3
python3-docs
python3-devel
python3-idle

python3-pygame

python3-qt5
python3-qt5-devel

python3-mod_wsgi
python3-tkinter
python3-gobject
python3-paramiko
python3-sphinx
python3-sphinx_rtd_theme
python3-gunicorn

python3-selenium
python3-beautifulsoup4
python3-django
python3-flask
python3-pylint
python3-certbot
python3-gunicorn
python3-bpython
python3-urwid
python3-scapy
python3-scrapy

uwsgi

%end

#%post --erroronfail
#
## There is no DNS resolution here, these don't work!
## Python packages that are not in yum repos
#python3 -m pip install \
#pyttsx3 \
#python-aiml \
#
#%end
