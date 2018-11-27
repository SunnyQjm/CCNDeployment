#!/bin/bash

DEFAULT_DIR=~/Documents
function cloneOrUpdate() {
    cd $DEFAULT_DIR
    name=$1
    url=$2
    if [ -d $name];then
        cd $name
        git update
    else
        git clone $url
        cd $name
    fi
}

# install nfd use apt
#sudo apt-get install software-properties-common -y
#sudo add-apt-repository ppa:named-data/ppa
#sudo apt update
#sudo apt-get install nfd -y

# install ndn-cxx prerequesites
sudo apt-get install build-essential libsqlite3-dev libboost-all-dev libssl-dev -y
sudo apt-get install doxygen graphviz python-sphinx python-pip -y
sudo pip install sphinxcontrib-doxylink sphinxcontrib-googleanalytics

# install ndn-cxx
cloneOrUpdate ndn-cxx https://github.com/named-data/ndn-cxx.git
./waf configure --enable-static
./waf
sudo ./waf install

# install nfd
sudo apt-get install build-essential pkg-config libboost-all-dev \
                     libsqlite3-dev libssl-dev libpcap-dev -y
sudo apt-get install doxygen graphviz python-sphinx -y
cloneOrUpdate NFD https://github.com/named-data/NFD.git
./waf configure
./waf
sudo ./waf install

# install ChronoSync
cloneOrUpdate ChronoSync https://github.com/named-data/ChronoSync.git
./waf configure
./waf
sudo ./waf install

# install NLSR
cloneOrUpdate NLSR git clone https://github.com/named-data/NLSR.git
./waf configure
./waf 
sudo ./waf install

# install ndn-tools
sudo apt-get install libpcap-dev -y
cloneOrUpdate ndn-tools https://github.com/named-data/ndn-tools.git
./waf configure
./waf
sudo ./waf install

# enforce loading lib
sudo ldconfig
