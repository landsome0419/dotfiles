## install firefox

echo "Starting Manjaro I3 installation process"
sleep 3
echo " Installing Firefox"
sudo pacman -S firefox

## install neofetch
clear
echo "Installing Neofetch"
git clone https://github.com/dylanaraps/neofetch.git

## install ruby
echo "installing ruby"
pacman -S ruby

## install lolcat
clear
echo "installing lolcat"
sleep 1
gem install lolcat

## install zsh
echo "installing ZSH"
sleep 1
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## install zsh fonts
echo "installing zsh fonts"
cd
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

## copying dotfiles to computer
clear
echo "copying dotfiles to computer"
cd dotfiles
cp config ~/.i3/config 
cp .Xresources ~/.Xresources
cp .zshrc ~/.zshrc
echo "Done"

read -p "Would you like to reboot to take effect (y/n) " -n 1 -r
echo 
if [[  $REPLY =~ ^[Yy]$ ]]
then 
	reboot
fi

