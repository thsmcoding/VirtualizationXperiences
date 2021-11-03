#!/usr/bin/bash
#VARIABLES AND INITIALIZATION
CURRENT=$pwd
INSTALL= 'sudo apt-get -y install'
CHECK_GCC='$(echo g++ --version|wc -c)'
EMACSVERSION=emacs27.2
EMACSPCKG="$EMACSVERSION.tar.gz"
echo "Setting up Vagrant machine: "$CURRENT	
#debugging : show commands and lines
set -u; set -v; set -x
sudo apt-get -y install
$INSTALL git
$INSTALL curl
sudo apt install build-essential && $INSTALL texinfo libtinfo-dev
[[ CHECK_GCC -le 0 ]]; echo "MISSING G++ AND GCC">> /dev/stderr
VAG_HOME=home/vagrant/
if [[ -d "$VAG_HOME" ]]; then 
	cd $VAG_HOME
else 
	mkdir -p $VAG_HOME && cd $VAG_HOME
fi	
sudo -u vagrant mkdir -p $VAG_HOME/.emacs.d
sudo -u vagrant ln -sf /vagrant/cstarter.el $VAG_HOME/.emacs.d/init.el
if [[ ! -f /vagrant/archive/$EMACSPCKG ]]; then
	mkdir -p /vagrant/archive
	curl -XGET -O "http://ftp.gnu.org/gnu/emacs/$EMACSPCKG"
	mv -f $EMACSPCKG /vagrant/archive/
fi
tar xzvf /vagrant/archive/$EMACSPCKG
cd $EMACSPCKG
./configure --without-all --with-zlib
make
sudo make install

#clean directory
cd $VAG_HOME
rm -rf $EMACSVERSION
echo "Setup done..."