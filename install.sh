## script made my landsome0419 ##

## git config ##
echo "Starting Manjaro I3 installation process"
echo "

"
sleep 3 
echo "configuring git"
git config --global user.email "landsome@protonmail.com"
git config --global user.name "landsome0419"

## install Firefox ##
clear

if [ -a /usr/bin/firefox ]
then 
	echo "The application Firefox exists."; echo "Skipping."
	sleep 2 
else
	echo "The application Firefox does not exist."; echo "installing."
	sleep 2
	sudo pacman -S firefox
fi

clear

## install Neofetch ##
if [ -d ~/neofetch/ ]
then
	echo "Neofetch already exists."; echo "Skipping."
	sleep 2
else
	echo "Neofetch does not exists."; echo "installing."
	sleep 2
	cd
	git clone https://github.com/dylanaraps/neofetch.git

fi

clear

## install ruby ##
if [ -f /usr/bin/ruby ] 
then 
	echo "Ruby already exists."; echo "Skipping."
	sleep 2
else
	echo "Ruby does not exists."; echo "installing."
	sleep 2
	cd
	sudo pacman -S ruby
fi

clear

## install lolcat ##
if [ -f /home/axel/.gem/ruby/2.6.0/bin/lolcat ]
then
	echo "lolcat already exists."; echo "Skipping."
	sleep 2
else
	echo "lolcat does not exists."; echo "installing."
	sleep 2
	gem install lolcat
fi

clear

## install fonts ##
read -p "Would you like to install terminal fonts? (Y/n) " -n 1 -r
echo 
if [[ $REPLY =~ ^[nN]$ ]] 
then
	echo "You answerd no"
	sleep 2
	echo "Proceeding with installation."
	sleep 2
else
	sleep 2
cd
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

fi

clear

## copying dotfiles to computer ##
echo "copying dotfiles to computer"
sleep 2
cd manjaro
cp config ~/.i3/config
cp .Xresources ~/.Xresources
cp .zshrc ~/.zshrc


## install zsh ##
if [ -f /usr/bin/zsh ]
then
	echo "Zsh already exists."; echo "Skipping."
	sleep 2
else
	echo "Zsh does not exists."; echo "installing."
	sleep 2
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

fi

clear

## install alsa mixer

if [ -f /usr/bin/alsamixer ]
then
	echo "Alsa-mixer exists."; echo "Skipping."
	sleep 2
else
	echo "Alsa-mixer does not exist."; echo "installing."
	sleep 2
	sudo pacman -S alsa-utils
	sleep 2
	echo "Adding user to audio group"
	sudo gpasswd -a $USER audio
	sleep 2
	echo "Done" 
	sleep 1
fi

## update system ##
echo "Updating System"
sleep 2
sudo pacman -Syu

## Reboot ## 
read -p "Would you like to reboot to take effect? (Y/n) " -n 1 -r
echo
if [[  $REPLY =~ ^[nN]$ ]]
then
	echo "you answered no"
	sleep 2
	echo "Clearing screen"
	sleep 1
	clear
	source ~/.zshrc
else
	for i in . .. ... ....
do
	clear
	echo "Rebooting $i"
	sleep 1
done

reboot

fi
