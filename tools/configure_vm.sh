#! /bin/sh

# TODO: Install Deps
apt-get install vim

mkdir ~/bin ; cd ~/bin
wget https://raw.github.com/Vido/floydberry/master/tools/install_stoq.sh
chmod +x install_stoq.sh
./install_stoq.sh

