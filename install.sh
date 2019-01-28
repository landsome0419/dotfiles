## git config
echo "Starting Manjaro I3 installation process"
echo "

"
sleep 3 
echo "configuring git"
git config --global user.email "landsome@protonmail.com"
git config --global user.name "landsome0419"

## install firefox
clear
echo " Installing Firefox"
sleep 2
sudo pacman -S firefox

## install neofetch
clear
echo "Installing Neofetch"
cd
git clone https://github.com/dylanaraps/neofetch.git

## install ruby
clear
echo "installing ruby"
cd
sudo pacman -S ruby

## install lolcat
clear
echo "installing lolcat"
echo "

"
sleep 2
gem install lolcat

## install zsh fonts
clear
echo "installing zsh fonts"
echo "

"
sleep 2
cd
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

## copying dotfiles to computer
clear
echo "copying dotfiles to computer"
echo "

"
sleep 2
cd manjaro
cp config ~/.i3/config 
cp .Xresources ~/.Xresources
cp .zshrc ~/.zshrc


## install zsh
echo "installing ZSH"
sleep 1
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## status
echo "Firefox...... Done."
sleep 1
echo "Neofetch......Done"
sleep 1
echo "ruby..........Done."
sleep 1
echo "lolcat........Done."
sleep 1
echo "zsh fonts....Done."
sleep 1
echo "dotfiles.....Done."
echo "zsh..........Done."
echo "Done"

read -p "Would you like to reboot to take effect (y/n) " -n 1 -r
echo 
if [[  $REPLY =~ ^[Yy]$ ]]
then 
	reboot
fi

