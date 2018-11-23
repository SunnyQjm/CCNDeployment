#!/bin/bash

# install nfd use apt
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:named-data/ppa
sudo apt update
sudo apt-get install nfd -y

# install ndn-cxx prerequesites
sudo apt-get install build-essential libsqlite3-dev libboost-all-dev libssl-dev -y
sudo apt-get install doxygen graphviz python-sphinx python-pip -y
sudo pip install sphinxcontrib-doxylink sphinxcontrib-googleanalytics

# install ndn-cxx
cd ~/Documents
git clone https://github.com/named-data/ndn-cxx.git
cd ndn-cxx
./waf configure --enable-static
./waf
sudo ./waf install

# install ChronoSync
cd ~/Documents
git clone https://github.com/named-data/ChronoSync.git
cd ChronoSync
./waf configure
./waf
sudo ./waf install

# install NLSR
cd ~/Documents
git clone https://github.com/named-data/NLSR.git
cd NLSR
./waf configure
./waf 
sudo ./waf install

# enforce loading lib
sudo ldconfig
