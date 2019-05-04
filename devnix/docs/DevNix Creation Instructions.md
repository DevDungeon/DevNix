# DevNix Build Instructions

This document provides information about how to build and package
the DevNix Linux distrubtion.

DevNix is a Fedora based Linux distribution developed
by nanodano@devdungeon.com aimed at polyglot developers and hackers.

Learn more about DevNix at [[[[[[[[[[[[[[[[About DevNix]]]]]]]]]]]]]]]].



## Initial steps

These are all the steps needed to create the customized
version of Fedora Linux tailored for polyglot developers and hackers.

- Install the Fedora VM using VMWare player
- Optionally encrypt disk. Set user name and password.
- Install some core packages:

```bash
sudo yum install util-linux-user # for chsh
sudo yum install zsh vim nvim gcim emacs git tmux
sudo yum groupinstall "Development Tools" gcc-c++
sudo yum install libXt-devel libXScrnSaver libxkbfile-devel libsecret-devel
sudo yum install chromium
sudo yum install gpg keepass
sudo yum install filezilla
sudo yum install ruby jruby
sudo yum install rust cargo

chsh # /bin/zsh
```


## Setup the Zsh and Vim dotfiles:


get zsh and vimrc and ssh config files from nanobin or self repo

```bash
git clone https://github.com/NanoDano/NanoBin
NanoBin/setmeup.sh

# Link neovim rc to vimrc
ln -s /home/nanodano/.vimrc /home/nanodano/.config/nvim/init.vim
```


## Install Java tools

### Install JDK

Install the JRE, along with the JDK and JavaFX packages.
Also include the common build tools: ant, maven, and gradle.
```bash
sudo yum install java-1.8.0-openjdk{,-devel,-openjfx} ant maven gradle
```

### Switch default JDK using alternatives

```bash
alternatives --list
sudo alternatives --config java
# Choose the desired option (1.8 for now)
```




- Prepare the `~/src/` directory to store all source code:

```bash
mkdir ~/src
mkdir ~/bin
cd ~/src
```


## Customize Gnome Desktop

https://www.devdungeon.com/content/customizing-gnome-3-desktop-environment-arch-linux

- Setup caps lock to escape key mapping with:

```bash
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
```

- Add Terminal to favorites
- Add KeePass to favorites
- Hide menubar from terminal
- Remove junk from favorites
- add other goodies to favorites (only stuff that everyone won't need to remove)
- Add the minimize button on windows?
- Gnome Shell extensions
  - https://extensions.gnome.org/local/
  - Add browser extension
 - Store => Gnome Tweaks tool
    - Extension: Background logo - change
    - Top Bar: Clock: Weekday: Date: seconds
    - Window Titlebars: show minimize
    - Extensions: Places status indicator on
    - Add dash-to-dock extension
      - `sudo yum install gnome-shell-extension-dash-to-dock`
      - Run Gnome tweak tool, config and turn on dash-to-dock

### Install Fonts

The default fonts are fairly nice but there are a couple fonts that are
particularly well suited for source code and Linux. These are totally
optional but recommended.

#### Hack Font

Hack is an MIT-licensed monospace font intended for source code.
Read more at
Find the source at [https://github.com/source-foundry/Hack](https://github.com/source-foundry/Hack).

- Download the latest version from GitHub, e.g.:
https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
-

```bash
cd ~/Downloads
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip
sudo mv ttf /usr/share/fonts/hack
fc-cache -f -v
fc-list | grep Hack
```

### Ubuntu Font Family

https://design.ubuntu.com/font/

```bash
cd ~/Downloads
wget https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip
unzip fad7939b-ubuntu-font-family-0.83.zip
sudo mv ubuntu-font-family-0.83 /usr/share/fonts
fc-cache -f -v
fc-list | grep ubuntu
```

## Visual Studio Code

VSCode is a great editor. You can use it for simple text editing,
install plugins to support any language, has a terminal,
and is easily modified.
VSCode is MIT licensed.

While you can install the proper Visual Studio Code from the Microsoft
website, and it will happily co-exist, we are going to build the OSS
version from the source on GitHub. It will have all the same features,
but it won' thave and of the trademarked logos,

#### Build Visual Studio Code from source

```bash
git clone https://github.com/Microsoft/vscode
cd vscode
sudo yum install nodejs
sudo npm install -g yarn gulp
yarn  # Will install deps and build
```

- Run with `scripts/code.sh`.

#### Turn off telemtry data

Go to `File | Preferences | Settings` and turn off:

- Telemetry: Enable Crash Reporter
- Telemetry: Enable Telemetry

#### Create shell launcher

Now that we have the `code.sh` launcher available, we should add it to our `PATH`
Modify the `~/.zhsrc.local` to add:

```bash
ln -s $HOME/src/vscode/scripts/code.sh $HOME/bin/code
```

After doing this, and ensuring `$HOME/bin` is in your `PATH`, then you can
run it from the shell or from `ALT-F2` by entering `code`.

#### Create an application launcher icon

Run the app first, then open a terminal and run:

```bash
xprop WM_CLASS
# Then click on the editor window.
# It will output something like:
# WM_CLASS(STRING) = "code-oss-dev", "code-oss-dev"
```

Then create a desktop icon launcher at:

`$HOME/.local/share/applications/devcode.desktop`

Here is the contents template:

```
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=DevCode
Comment=DevCode
Exec=devcode
Icon=$HOME/src/code/launch_icon.png
Terminal=false
StartupWMClass=code-oss-dev
```

The `StartupWMClass` will allow all open windows of that application to
use the same launcher icon instead of creating a duplicate icons.

Add it to the favorites.


#### Color Theme

Select the gear in the bottom left to choose the theme or modify
the `settings.json` file to specify a `workbench.colorTheme`.

Set the `One Dark Pro`

#### Icon Theme

Set Material Icon theme

#### Plugins

By default the source build does not have any plugin repository configured.
You can either add the official public repository to your config or add
plugins manually.

To add the Microsoft repository for plugins, edit
`~/.config/code-oss-dev/product.json` to include:

```json
    "extensionsGallery": {
        "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
        "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
        "itemUrl": "https://marketplace.visualstudio.com/items"
    }
```

This step does not require recompilation. After adding the config and
restarting the app, the extensions tab (`CTRL-SHIFT-X`) has all the themes,
extensions, and icon packs available.

#### Settings files

https://code.visualstudio.com/docs/getstarted/settings

https://code.visualstudio.com/docs/getstarted/settings#_default-settings


Use settings in `~/.config/code-oss-dev/User/settings.json`.

Example `settings.json`:

```json
{
    "workbench.colorTheme": "Solarized Dark",
    "editor.cursorBlinking": "phase",
    "editor.fontFamily": "'Hack', 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'",
    "keyboard.dispatch": "keyCode", // so that Caps-to-Escape mapping works
    //"vim.enableNeovim": true,
    //"vim.neovimPath": "/usr/bin/nvim",
}
```




<!--

??????????????????????????????


### Setup Android SDK

I cannot do this step for the distro because there is a terms and
conditions that must be signed and agreed to.

Fedora Android instructions available at https://fedoraproject.org/wiki/HOWTO_Setup_Android_Development#Install_Android_SDK

- Download the SDK from https://developer.android.com/studio
- Unpack it and add it to your `PATH` environment variable.

```bash
# In `$HOME/.zshrc`
export PATH=$PATH:$HOME/AndroidSDK/tools:$HOME/AndroidSDK/tools/bin
mkdir $HOME/.android
touch $HOME/.android/repositories.cfg
sdkmanger --help
sdkmanager --list
sdkmanager --update
```

- Ensure `android`, `sdkmanager`, `adb` and `avdmanager`, `apkanalyzer` alias is available.
- Create one virtual device, alias `avd` to it

- TODO how to install the right tools w/o gui?
???????????????????????????????????????????????

-->

<!--
### JetBrains IDEs

JetBrains provides two IDEs for free:

- IntelliJ Community
- PyCharm Community
- Android Studio (the official Android IDE)

You can also download the source from
[https://github.com/JetBrains/intellij-community](https://github.com/JetBrains/intellij-community).

IntelliJ is a powerful IDE that is good for projects that outgrow Visual Studio Code.
IntelliJ Community is Apache 2.0 licensed.

#### Installing the JetBrains Toolbox

The easiest way to install the tools you want
from the JetBrains suite is the Toolbox.

Get it from [https://www.jetbrains.com/toolbox/app/](https://www.jetbrains.com/toolbox/app/).

- Download it
- Extract it
- Run the script

After installing it you can install the tools you want. You can skip the sign in process if you only
want to use the free ones.

Install the ones you need.


#### Build IntelliJ from source

It builds **multiple** IDEs!

- Android Studio
- PyCharm
- IntelliJ or IntelliJ w/ Python plugin

Once the pre-built IntelliJ is installed you can build
IntelliJ from source and then build your own version.
Afterwards, you can choose to uninstall the JetBrains IntelliJ.

- Increase inotify limits: org.jetbrains.intellij.build package
    - add `fs.inotify.max_user_watches = 524288` to `/etc/sysctl.conf`,
      then run `sudo sysctl -p --system`
- Clone https://github.com/JetBrains/intellij-community
- Open it in IntelliJ
- Create  a JDK named `IDEA jdk` in IntelliJ of JDK 8.
    - Add `/usr/lib/jvm/java-1.8.0-openjdk/lib/tools.jar` to classpath.
    - Add `/usr/lib/jvm/java-1.8.0-openjdk/jre/lib/ext/jfxrt.jar` to classpath.
- (Maybe) Run the Gradle `setupDependencies`
- Edit the build config to allow parallel build
- Turn on `Settings | Compiler | Compile independent modules in parallel`
- Run `Build | Build project`

- Run `ant` in the main directory to build installers, otherwise, just
  run it directly from the Main class:

```
/usr/lib/jvm/java-1.8.0-openjdk/bin/java \
 -ea \
 -Xmx192m \
 -Didea.is.internal=true  \
 -Didea.platform.prefix=PyCharmCore  \
 -javaagent:/home/nanodano/.local/share/JetBrains/Toolbox/apps/IDEA-C/ch-0/191.6183.87/lib/idea_rt.jar=46411:/home/nanodano/.local/share/JetBrains/Toolbox/apps/IDEA-C/ch-0/191.6183.87/bin \
 -Dfile.encoding=UTF-8 \
-classpath /usr/lib/jvm/java-1.8.0-openjdk/jre/lib/charsets.jar:.......
com.intellij.idea.Main
```


#### Customizing the new IntelliJ

// TODO
// Install github desktop from source -


modify inotify count
- Rebrand it
- Icon
- Name
- Theme
- set Hack font 14 for editor
- remove tabs
- Add a bunch of plugins for all languages
- vim plugin
    - Change some hotkeys (ctrl s, ctrl e)

## Chromium and Firefox Webdrivers

The web driver tools are useful for Selenium driving of browsers.

Download, extract, and place the executables
in the `~/bin` directory.

- Chromium web driver: [https://sites.google.com/a/chromium.org/chromedriver/downloads](https://sites.google.com/a/chromium.org/chromedriver/downloads)
- Gecko Driver for Firefox: [https://github.com/mozilla/geckodriver/releases](https://github.com/mozilla/geckodriver/releases)

Be sure to download the right version that matches
the browser version. For example, the Chrome driver
is one version old in the Yum repos.
-->

## Setup Docker

To setup Docker, first install the package, then create a group and update
the permissions and user group so you don't need `sudo` to run `docker`.

```bash
sudo yum install docker
sudo systemctl enable docker
sudo systemctl start docker
sudo groupadd docker
sudo chown root:docker /var/run/docker.sock
sudo gpasswd -a $USER docker
# Relog/reboot
docker pull alpine
docker images  # Verify it pulled
docker run -it alpine  # Run a shell to confirm
```

## Customize Firefox and Chromium

- Show bookmarks bar
- Put all Fedora bookmarks in to a subdir
- Add bookmarks for devdungeon, github, docs, language downloads, frameworks, etc
  awesome repos,
- Extensions:
    - vimium



## Set up GitHub Desktop from source

```bash
cd ~/src
git clone https://github.com/deskto/desktop
cd desktop
yarn
yarn build:prod
cd dist/desktop-linux-64
./desktop
```
// TODO
- Create desktop launcher icon
- Decide if this app is worth keeping


## Virtualization tools

Check for `boxes` already being installed.

```bash
sudo yum qemu qemu-kvm virt-manager
virt-manager  # Test it out
```

If you are using a virtual machine like VMWare Player, you may need to alter
the machine settings to allow virtualization. For example, in VMWare Player,
edit the virtual machine settings and check on the processor option
`Virtualize Intel VT-x/EPT or AMD-V/RVI`.






## Other Tips

- `CTRL-SHIFT-C` is a shortcut to the terminal.
- Use RhythmBox's Radio section to listen to free internet radio
- Fedora Gnome screen is on the `CTRL-ALT-F2` screen.
    - Use `CTRL-ALT` with `F3`, `F4`, `F5`, and `F6` for terminals

- Customizations include but are not limited to...
    - Zsh and Vim dotfiles
    - VSCode built from src/ dir
    - IntelliJ Community built from src/ dir
- DevBrains can live side-by-side with any JetBrains software
- DevCode can live side-by-side with official Visual Studio Code
- DevBrains vim hotkeys can be changed if you prefer an IDE hotkey vs the vim hotkey
- Use `alternatives` to switch between multiple installed versions (e.g. Java)

```bash
alternatives --list
sudo alternatives --config java
# Choose the desired option from the menu
```

- Use Boxes to create virtual machines



- redo all of this for arch linux once I figure out hwo to get
  the video driver integration working as nice aas fedora does
- Change default file manager to Dolphin??, make icons small, add Terminal to toolbar, add open terminal, add new tab, new window

- checklist - does it have everything needed for the end of the world? (some communication/torrent software too? pidgin+otr, )

nevermind, find alternative?
### Build KeepNote from source

KeepNote is a great note taking application that is also useful for
creating reports after a penetration test. You can store notes in HTML,
attach files, take screenshots, and more.

If you don't want to build from source you can just install the `.rpm`
from [keepnote.org](http://keepnote.org/), for example, [http://keepnote.org/download/keepnote-0.7.8-1.noarch.rpm](http://keepnote.org/download/keepnote-0.7.8-1.noarch.rpm).

- Add to favorites

```bash
cd ~/src
git clone https://github.com/mdrasmus/1note/
```



## Add offline docutmentation

https://devdocs.io/offline
- Add bookmark to browsers
https://devdocs.io/about
https://marketplace.visualstudio.com/items?itemName=deibit.devdocs
https://github.com/rhysd/devdocs.vim



<!--
## Install Apache NetBeans from source

Options:

- Download the binaries directly
- Build from source from website downloads
- Build from source from latest github

From github options:

```bash
cd ~/src
git clone https://github.com/apache/incubator-netbeans netbeans
cd netbeans
ant
# or
ant -Dcluster.config=full
./nbbuild/bin/netbeans
```


Get the latest source from https://netbeans.apache.org/

```bash
cd ~/src
mkdir netbeans
cd netbeans
wget https://www.apache.org/dyn/closer.cgi/incubator/netbeans/incubating-netbeans/incubating-11.0/incubating-netbeans-11.0-source.zip
unzip incubating-netbeans-11.0-source.zip
ant
```

Run it with:

```bash
~/src/netbeans/nbbuild/netbeans/bin/netbeans
```

### Create shell launcher

Now that we have the `netbeans` executable available,
we should add it to our `PATH`.
Modify the `~/.zhsrc.local` to add:

```bash
ln -s $HOME/src/netbeans/nbbuild/netbeans/bin/netbeans $HOME/bin/netbeans
```

After doing this, and ensuring `$HOME/bin` is in your `PATH`, then you can
run it from the shell or from `ALT-F2` by entering `netbeans`.

### Create an application launcher icon

Run the app first, then open a terminal and run:

```bash
xprop WM_CLASS
# Then click on the editor window.
# It will output something like:
# WM_CLASS(STRING) = "code-oss-dev", "code-oss-dev"
```


Create a desktop launch shortcut:

// TODO

```
[]
Exec=
StartupWMName=
```
-->


## Social and chat

### Pidgin + OTR

For IRC, XMPP/Jabber, and other chat services, Pidgin is installed with
Off-the-record (OTR) end-to-end encryption plugin.

- Install Pidgin+OTR with: `sudo yum install pidgin-otr`.
- Open `pidgin`.
- Go to `Tools | Plugins` or press `CTRL-U`.
- Type `off-the-record` to search or scroll to `Off-the-Record Messaging`
- Check the `Enabled` box.
- Click `Configure Plugin`.
- Close the windows and application.


## RSS feeds

Akregator is installed by default and can be launched from the Applications
menu or executing `akregator`.

Add feeds for relevant topics:

- DarkReading
- PacketStorm
- CVE
- HackerNews
- SubReddits

## Browser bookmarks

https://developer.android.com/studio
https://www.github.com
https://www.bitbucket.org
vscode
jetbrains
awesome repos


// TODO
## Even further customization after installation

- Install any proprietary software you want to, perhaps
  - Official NVIDIA graphics drivers
  - Sublime Text
  - Visual Studio Code
  - Discord
  - The JetBrains suite of commercial products
  - VMWare Player
  - MySQL Workbench

- Install other software as desired
  - Browse the software store
  - ThunderBird for Email
  - Atom editor
  - VirtualBox?
  - Qemu?

- Change docked favorite applications
- Change browser bookmarks
- Modify, extend, or replace any dotfiles you desire













## Creating a LiveCD & Installer (.iso)

Install a fresh Fedora to disk
and then follow these steps.

https://fedoraproject.org/wiki/Remix
https://wiki.centos.org/TipsAndTricks/KickStart
https://anaconda-installer.readthedocs.io/en/latest/
https://github.com/livecd-tools/livecd-tools
https://fedoraproject.org/wiki/Remix#How_do_I_remix_Fedora.3F
https://github.com/SamsungARTIK/fedora-spin-kickstarts
https://pagure.io/fedora-kickstarts
https://wiki.sugarlabs.org/go/Tutorials/Installation/Build_Your_Own_Remix_with_Fedora
https://fedoraproject.org/wiki/Creating_Fedora_Remix_%282008-11-09_classroom%29
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s1-kickstart2-options
https://en.wikipedia.org/wiki/Kickstart_(Linux)
system-config-kickstart gui?
https://en.wikipedia.org/wiki/Anaconda_(installer)

Man page for `livecd-creator`
https://linux.die.net/man/8/livecd-creator
https://linux.die.net/man/8/livecd-iso-to-disk
https://fedoraproject.org/wiki/Livecd-iso-to-disk

https://www.peterpap.net/index.php/Sample_Kickstart_Configuration_file

### Steps

Here is an overview of the steps involved. Each step is covered in more
detail in subsequent sections.

1. Install [livecd-tools](https://github.com/livecd-tools/livecd-tools).
2. Clone the kickstart scripts from [https://pagure.io/fedora-kickstarts](https://pagure.io/fedora-kickstarts).
2. `git checkout --track -b f30 origin/f30` # Switch to f30 branch
3. Create the kickstart script
4. Build the .iso
5. Copy the .iso to a USB flash drive


#### Install livecd-tools


This provides `livecd-creator` which will take a kickstart (`.ks`) script
and build an `.iso`. It also provides `livecd-iso-to-disk` to take the
`.iso` file and copy it to a USB flash drive.

```bash
sudo yum install livecd-tools
```


#### Get the kickstart scripts

You can install the scripts from yum

```bash
yum install l10n-kickstarts
yum install fedora-kickstarts
# Installs them to
# /usr/share/spin-kickstarts
```

Or you can clone them from the repository.
This provides the official base set of Fedora kickstart scripts for
reference and re-use.

```bash
git clone https://pagure.io/fedora-kickstarts.git
```


// UPDATE
Pull devnix fork

https://github.com/NanoDano/DevNix  (f30 branch)


##### Pulling upstream updates

- Upstream source is: `https://pagure.io/fedora-kickstarts.git`
- Pull any updates from there in to hereo




#### Create the kickstart file

Copy a kickstart script and modify it.

```
cd fedora-kickstarts
cp fedora-disk-workstation.ks devnix.ks
vi devnix.ks
# Add packages and post script
```


####  Build the .iso

```
sudo livecd-creator fedora-live-workstation.ks --fslabel=DevNix-30-Live-x86_64
```




```
livecd-creator fedora-live-workstation.ks # fedora-disk-workstation fails because wifi drivers missing
```

Barebones LiveCD

```
livecd-creator --config=/usr/share/livecd-tools/livecd-fedora-minimal.ks
```

Fedora Desktop Live CD

```
livecd-creator --config=/usr/share/livecd-tools/livecd-fedora-desktop.ks --fslabel=Fedora9-LiveCD-foo
```



#### Copy the .iso to a USB flash drive


Insert USB
figure out what the drive is
dmsg?

use livecd-iso-to-disk
https://linux.die.net/man/8/livecd-iso-to-disk

```bash
livecd-iso-to-disk /path/to/the.iso /dev/sdx
```


### Notes about Anaconda and Kickstart scripts

- Multiple `%post` sections are allowed.
- If it says there is not enough disk space, modify `fedora-live-workstation.ks`
  and increase the partition size by a couple gb `part / --size 8656`. It will only
  increase the temporary build size and the final `.iso` will not be that size.
- In the %post section, there is no DNS resolution yet, must use IP addresses
- Use `%post --nochroot` to use the binaries and path from build environment
  - `$INSTALL_ROOT/` and `$LIVE_ROOT/` provide paths to the build environment
  - In general, use `$INSTALL_ROOT/`
  - Current working directory is your actual CWD and you have access to your host environment
- If a build fails due to `bcm283x-firmware` just comment out that firmware.
  I suspect it requires `epel` repos to be added or something, not sure why that one breaks.
- You can abort build on failure with `%post --erroronfail`
- It is possible to have `%post` scripts parsed by Python or other interpreters
  `%post --interpreter=/usr/bin/python`
- It is possible to log output `%post --log=/root/my-post-log`. Path depends on
  `--nochroot` status.












## To do

- GSConnect/KDEconnect setup
- Add custom icons & background
- Have the devdocs tool installed
- Install other hacking/dev browser extensions and tools
- Install other languages (crystal,dart, flutter, go, rust, haskell, )
- Consolidate the yum installs
- Install Hack font https://sourcefoundry.org/hack/
- Setup SSH config
 -vim mode in zsh, brains, code, firefox/chrome
 - modify ram on jetbrains ide
 - make sure all editor instructions include hack font swap
- zeal docs/devdocs/real docs
- make sure ALL compilers/interepters: R, rust, etc
- ensure bookmarks for all languages are in browser
 - Maybe install regular vscode too https://code.visualstudio.com/docs/setup/linux

 - include disk partitioning tools
 - Install from source: https://github.com/mysql/mysql-workbench
 - packaging/respin info
 - rebrand - themes, colors, desktop,
- install qemu or virtualbox or both, have one tiny arch linux install w/ no x11
  or a tiny livecd or alpine
- Install powershell
- create yum repos for devcode and devbrains for easy yum install/uninstall and to jenkinsify auto updates
- Make a video walking through the entire setup process and showing
  all the customizations and features
- add kolour paint or equivalent
- remove stuff I don't need like contacts/   