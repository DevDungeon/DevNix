%post --nochroot --erroronfail





## Apache Netbeans
wget https://www-eu.apache.org/dist/incubator/netbeans/incubating-netbeans/incubating-11.0/incubating-netbeans-11.0-bin.zip
copy over
create launcher

## Visual Studio Code (OSS)
wget https://github.com/microsoft/vscode/archive/1.34.0.tar.gz
yarn build
copy over
create launcher
-- configure settings files and turn off telemetry

## GluonHQ JavaFX Scene Builder 
wget https://download2.gluonhq.com/scenebuilder/11.0.0/install/linux/scenebuilder-11.0.0-1.x86_64.rpm
dnf install -y scenebuilder-11.0.0-1.x86_64.rpm

## Crystal programming language
wget https://github.com/crystal-lang/crystal/releases/download/0.28.0/crystal-0.28.0-1.x86_64.rpm
dnf install -y crystal-0.28.0-1.x86_64.rpm
rm crystal-0.28.0-1.x86_64.rpm
create launcher


## Powershell
wget https://github.com/PowerShell/PowerShell/releases/download/v6.2.0/powershell-6.2.0-1.rhel.7.x86_64.rpm
dnf install -y powershell-6.2.0-1.rhel.7.x86_64.rpm
rm powershell-6.2.0-1.rhel.7.x86_64.rpm
create launcher


## ZAP
wget https://github.com/zaproxy/zaproxy/releases/download/2.7.0/ZAP_2.7.0_Linux.tar.gz
tar xzfv ZAP_2.7.0_Linux.tar.gz
create launcher to zap.sh

## amass
wget https://github.com/OWASP/Amass/releases/download/2.9.12/amass_2.9.12_linux_amd64.zip
unzip amass_2.9.12_linux_amd64.zip -d /opt
ln -s /opt/amass_2.9.12_linux_amd64/amass /usr/bin/amass
create launcher


## templos

https://templeos.org/Downloads/TempleOS.ISO (16mb)
wget https://templeos.org/Downloads/TempleOS.ISO -O /opt/TempleOS.iso
- create a virtual machine + launcher in app menu

%end