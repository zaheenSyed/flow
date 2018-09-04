#!/bin/bash
echo "Installing system dependencies for SUMO"
sudo apt-get update
sudo apt-get install -y subversion autoconf build-essential libtool
sudo apt-get install -y libxerces-c3.1 libxerces-c3-dev libproj-dev
sudo apt-get install -y proj-bin proj-data libgdal1-dev libfox-1.6-0
sudo apt-get install -y libfox-1.6-dev

echo "Installing sumo binaries"
mkdir bin
pushd bin
wget https://akreidieh.s3.amazonaws.com/sumo/flow-0.2.0/binaries-ubuntu1404.tar.xz
tar -xf binaries-ubuntu1404.tar.xz
rm binaries-ubuntu1404.tar.xz
chmod +x *
popd
echo 'export PATH=$PATH:'$(pwd)'/bin' >> ~/.bashrc
echo 'export SUMO_HOME='$(pwd)'/bin' >> ~/.bashrc

source ~/.bashrc
