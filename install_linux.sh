#!/bin/bash

# Install dependencies
sudo apt install -y npm curl software-properties-gtk unzip ripgrep

# Install lst Node
sudo npm install -g n
sudo n latest

sudo npm install -g neovim @johnnymorganz/stylua-bin 
sudo apt install -y clang-format

pip install neovim

# Install ctags
sudo apt-get install libjansson-dev
git clone https://github.com/universal-ctags/ctags.git --depth=1
cd ctags
./autogen.sh
./configure
make
sudo make install


#############
# Setup vim #
#############

# Install NVIM
# sudo snap install nvim --classic
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim

# Install vim plugins
nvim +PlugInstall +qall

# Install formatters and linters 
sudo npm install -g prettier

# Install YCM for vim
sudo apt install build-essential cmake python3-dev -y
python3 ~/.local/share/nvim/plugged/youcompleteme/install.py --clangd-completer


#################
# Install tools #
#################

# Install LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

