#! /bin/sh

# Writes the ~/.vimrc, for minimum dev features
read -p "Do you want to overwrite .vimrc file? [y/n]" answer
if [[ $answer = y ]] ; then
    cat > ~/.vimrc << EOL
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
EOL
fi

#http://wiki.stoq.com.br/index.php/Come%C3%A7ando
sudo apt-get install python python-gtk2 python-zopeinterface \
    python-psycopg2 python-imaging python-reportlab postgresql \
    postgresql-client python-dateutil python-mako python-gudev \
    python-poppler python-webkit python-twisted-core python-twisted-web \
    librsvg2-common python-xlwt gettext intltool git git-review \
    python-setuptools pep8 pyflakes python-mock pylint python-storm \
    vim

# Runs the STOQ script
mkdir ~/bin ; cd ~/bin
wget https://raw.github.com/Vido/floydberry/master/tools/install_stoq.sh
chmod +x install_stoq.sh
./install_stoq.sh

