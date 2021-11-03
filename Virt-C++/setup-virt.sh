#!/usr/bin/bash
#VARIABLES AND INITIALIZATION
CURRENT=$pwd
INSTALL= 'sudo apt-get -y install'

echo "Setting up Vagrant machine: "$CURRENT	
#debugging : show commands and lines
set -u; set -v; set -x
sudo apt-get -y install
$INSTALL git
$INSTALL curl
sudo apt install build-essential

