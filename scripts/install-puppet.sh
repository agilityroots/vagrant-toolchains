#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
# not installing puppet 4.6. see https://github.com/savishy/vagrant-boxes/issues/1
# This installs puppet for Ubuntu only.

if [[ `dpkg-query -W -f='${Status}' puppet-common 2>&1` =~ "installed" ]]; then
  echo "puppet-common already installed; no action"
else
  INSTALL=1
fi
if [[ `dpkg-query -W -f='${Status}' puppet 2>&1` =~ "installed" ]]; then
  echo "puppet already installed; no action"
else
  INSTALL=1
fi

if [[ $INSTALL -eq 1 ]]; then
  echo "Installing Puppet ..."
  export DEBIAN_FRONTEND=noninteractive
  sudo apt-get update -qqy
  sudo apt-get install -qqy wget unzip
  wget -q http://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
  sudo dpkg -i puppetlabs-release-pc1-xenial.deb
  sudo apt-get update -qqy
  sudo apt-get install -qqy puppetserver
fi

# update PATH
PATHSTR="export PATH=$PATH:/opt/puppetlabs/bin"
sudo chmod ugo+w /etc/profile
sudo echo "$PATHSTR" >> /etc/profile
