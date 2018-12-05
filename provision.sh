# update
pacman -Syyuy --noconfirm

# install app
pacman -Sy --noconfirm xorg-server xorg-xinit xorg-xinit lxdm xfce4 xfce4-goodies
pacman -Sy --noconfirm networkmanager network-manager-applet xf86-video-intel xf86-input-synaptics alsa-utils gvfs gvfs-mtp ntfs-3g
systemctl enable lxdm NetworkManager
sed -i /etc/lxdm/lxdm.conf -e 's;^# session=/usr/bin/startlxde;session=/usr/bin/startxfce4;g'
pacman -Sy --noconfirm ttf-dejavu wqy-microhei wqy-zenhei
pacman -Sy --noconfirm gvim git zsh chromium atom
pacman -Sy --noconfirm fcitx-im fcitx-configtool fcitx-googlepinyin
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --local
amixer -c 0 scontrols
pacman -Sy --noconfirm base-devel
su - vagrant -c 'git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && rm yay -rf'
# su - vagrant -c 'echo "[Desktop Entry]/nEncoding=UTF-8/nVersion=0.9.4/nType=Application/nName=alsa-tray/nComment=/nExec=alsa-tray/nOnlyShowIn=XFCE;/nStartupNotify=false/nTerminal=false/nHidden=false" >>~/.config/alsa-tray.desktop'
su - vagrant -c 'yay -Sy --noconfirm alsa-tray'
echo 'vagrant' | su - vagrant -c 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
su - vagrant -c 'cp /usr/share/vim/vim*/vimrc_example.vim ~/.vimrc'
su - vagrant -c 'echo "set clipboard=unnamedplus" >> ~/.vimrc'
cp /usr/share/vim/vim*/vimrc_example.vim ~/.vimrc
echo "set clipboard=unnamedplus" >> ~/.vimrc
su - vagrant -c 'echo "defaults.pcm.card 0\ndefaults.pcm.device 0\ndefaults.ctl.card 0" >> ~/.asoundrc'
su - vagrant -c 'echo "export GTK_IM_MODULE=fcitx\nexport QT_IM_MODULE=fcitx\nexport XMODIFIERS=\"@im=fcitx\"" >> ~/.xprofile'
su - vagrant -c 'yay -Sy --noconfirm intellij-idea-ultimate-edition'
echo '0.0.0.0 account.jetbrains.com' >> /etc/hosts
su - vagrant -c 'yay -Sy --noconfirm jdk8'
echo 'export JAVA_HOME=/usr/lib/jvm/default' >> /etc/profile.d/jre.sh
reboot
