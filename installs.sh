#/bin/sh

APT_OPT="-q -y"
APT_INSTALL="sudo apt-get $APT_OPT install"

set +x

#MacBook Pro keyboard
cat keyboard >> /etc/default/keyboard
echo "KEYBOARD DONE"

#wifi
mkdir /lib/firmware/brcm/
wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/brcm/brcmfmac43602-pcie.bin /lib/firmware/brcm/
echo "wifi DONE"

#zsh
$APT_INSTALL zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# cp .zshrc /home/$USER/
# sudo cp .zshrc /root

#change default shell
chsh -s $(which zsh)
sudo -u $USER chsh -s $(which zsh)


# get the right oh my zsh themes
sed -i s/robbyrussell/agnoster/g /home/$USER/.zshrc
sed -i s/robbyrussell/aussiegeek/g /root/.zshrc

sed s+/root/.oh-my-zsh+/home/$USER/.oh-my-zsh+g /home/$USER/.zshrc

echo "ZSH DONE"
#terminator
$APT_INSTALL terminator
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O "/home/$USER/.config/terminator/plugins/terminator-themes.py"
cat terminator-config > "/home/$USER/.config/terminator/config"

echo "Terminator DONE"

#sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
$APT_INSTALL apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
$APT_INSTALL sublime-text

#programming
$APT_INSTALL vim gcc gdb make python python3 python3-pip 
$APT_INSTALL doxygen

#virtual machine
$APT_INSTALL qemu qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

#docker
$APT_INSTALL docker 

#hacking
#	general
$APT_INSTALL nmap wireshark jhon aircrack-ng 

#	bins
$APT_INSTALL binwalk radare2
#	web
$APT_INSTALL dirb
