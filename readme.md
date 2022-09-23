# base setup
'''bash
sudo apt update
sudo apt upgrade
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install build-essential cmake pkg-config automake libtool
git config --global user.name "Christian Franke"    
git config --global user.email "chriss@frankeonline.net"
mkdir .ssh && chmod 700 .ssh
# add private ssh key from 1password to ~/.ssh/id_ed2519
chmod 600 ~/.ssh/id_ed25519
ssh-keygen -f ~/.ssh/id_ed25519 -y > ~/.ssh/id_ed25519.pub 
'''

# install neovim from source
follow: 'https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source'
'''bash
wget https://github.com/neovim/neovim/archive/refs/tags/v0.7.2.tar.gz

'''
