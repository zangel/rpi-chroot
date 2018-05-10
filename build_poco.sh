#!/bin/bash

mkdir -p /tmp/rpi/src /tmp/rpi/build/poco

echo -e "\ndownloading poco-1.9.0 library ..."
cd /tmp/rpi/src
wget https://pocoproject.org/releases/poco-1.9.0/poco-1.9.0-all.tar.gz
tar zxf ../src/poco-1.9.0-all.tar.gz


echo -e "\nbuilding poco-1.9.0 library ..."
cd ../build/poco
cmake ../../src/poco-1.9.0-all '-GUnix Makefiles' -DCMAKE_BUILD_TYPE:STRING=Release -DPOCO_UNBUNDLED:BOOL=ON -DENABLE_DATA:BOOL=OFF -DENABLE_MONGODB:BOOL=OFF -DENABLE_ENCODINGS:BOOL=OFF -DENABLE_JSON:BOOL=OFF -DENABLE_PAGECOMPILER:BOOL=OFF -DENABLE_PAGECOMPILER_FILE2PAGE:BOOL=OFF -DENABLE_REDIS:BOOL=OFF -DENABLE_XML:BOOL=OFF -DENABLE_ZIP:BOOL=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr/local

make -j 8

echo -e "\ninstalling poco-1.9.0 library ..."
make install
rm -rf /tmp/rpi

