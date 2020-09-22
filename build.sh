#!/bin/bash

docker build . -t builder
mkdir -p rpms

docker run \
  -v /home/naadir/go/src/github.com/vmware/photon/SPECS/linux:/usr/src/photon/SPECS:z \
  -v ${PWD}/rpms:/usr/src/photon/RPMS:z \
  builder \
  sh -c "cp /usr/src/photon/SPECS/0008-vmxnet3-fix-encapsulation-for-ipip.patch \
         /usr/src/photon/SPECS/config \
         /usr/src/photon/SOURCES; rpmbuild -ba /usr/src/photon/SPECS/linux.spec"
