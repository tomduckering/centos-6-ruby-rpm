#!/bin/sh -e

sudo yum install -y rpm-build rpmdevtools readline-devel ncurses-devel gdbm-devel tcl-devel openssl-devel db4-devel byacc libyaml-devel libffi-devel make


# wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
# tar xzvf yaml-0.1.4.tar.gz
# cd yaml-0.1.4
# ./configure --prefix=/usr/local
# make
# sudo make install

curl -L -O http://pkgs.repoforge.org/libyaml/libyaml-devel-0.1.4-1.el6.rf.x86_64.rpm
curl -L -O http://pkgs.repoforge.org/libyaml/libyaml-0.1.4-1.el6.rf.x86_64.rpm

sudo yum localinstall -y /tmp/libyaml-0.1.4-1.el6.rf.x86_64.rpm
sudo yum localinstall -y /tmp/libyaml-devel-0.1.4-1.el6.rf.x86_64.rpm


rpmdev-setuptree
cd ~/rpmbuild/SOURCES
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.gz
cd ~/rpmbuild/SPECS
wget https://raw.github.com/imeyer/ruby-1.9.3-rpm/master/ruby19.spec
rpmbuild -bb ruby19.spec
ARCH=`uname -m`
KERNEL_REL=`uname -r`
KERNEL_TMP=${KERNEL_REL%.$ARCH}
DISTRIB=${KERNEL_TMP##*.}



sudo yum localinstall -y ~/rpmbuild/RPMS/${ARCH}/ruby-1.9.3p448-1.${DISTRIB}.${ARCH}.rpm
