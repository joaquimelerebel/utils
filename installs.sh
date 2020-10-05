#/bin/sh

set +x

#MacBook Pro keyboard
cat keyboard >> /etc/default/keyboard

#wifi
mkdir /lib/firmware/brcm/
cd /lib/firmware/brcm/
wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/brcm/brcmfmac43602-pcie.bin /lib/firmware/brcm/
cd

#zsh
sudo apt-get install zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp .zshrc /home/ulysse/
sudo cp .zshrc /root

#change default shell
chsh -s $(which zsh)
sudo -u ulysse chsh -s $(which zsh)

#theme
cd /usr/share/themes/
git clone https://github.com/freefreeno/Materia-Manjaro-Dark.git
cd

#icons 


#terminator
sudo apt-get install terminator

#sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text


#eclipse 
cd /home/ulysse/Downloads
wget https://www.eclipse.org/downloads/download.php?file=/oomph/epp/2020-09/R/eclipse-inst-jre-linux64.tar.gz&mirror_id=1099

