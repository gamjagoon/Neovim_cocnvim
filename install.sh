sudo apt update -y
minjae123
sudo apt upgrade -y
sudo apt install software-properties-common -y 
sudo apt install build-essential libssl-dev -y
echo "intstall nvm"

sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
source ~/.bashrc
nvm install 14.0.0
sudo apt install python3 python3-pip -y

cd ~
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
./nvim.appimage --appimage-extract
cd squashfs-root
sudo mv usr/bin/nvim /usr/bin/nvim
sudo mv usr/share/nvim /usr/share/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/.config/nvim -p
cd ~/Neovim_cocnvim
mv init.vim coc-settings.json tasks.ini ~/.config/nvim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

