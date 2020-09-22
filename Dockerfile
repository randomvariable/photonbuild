FROM photon:3.0

RUN tdnf makecache

RUN curl -o linux.src.rpm https://packages.vmware.com/photon/3.0/photon_srpms_3.0_x86_64/linux-4.19.145-1.ph3.src.rpm

RUN tdnf install -y gcc bison rpm-build bc kbd kmod-devel glib-devel \
  linux-api-headers xerces-c-devel xml-security-c-devel \
  libdnet-devel libmspack-devel Linux-PAM-devel openssl-devel \
  procps-ng-devel audit-devel elfutils-libelf-devel  binutils-devel \
  xz-devel libunwind-devel slang-devel python3-devel patch make gcc \
  glibc-devel bison diffutils gettext pciutils-devel rpm coreutils

RUN rpm -Uvh /linux.src.rpm

RUN mkdir -p /usr/src/photon/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

RUN ln -s  /root/rpmbuild /usr/src/photon
