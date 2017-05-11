#!/usr/bin/env bash

install_deps() {
  yum install -y epel-release curl &&
  yum install -y dkms &&
  yum groupinstall -y "Development Tools" &&
  yum install -y kernel-devel
}

install_latest_vbox_guest() {
  version=$(curl http://download.virtualbox.org/virtualbox/LATEST.TXT)
  iso="VBoxGuestAdditions_${version}.iso"
  curl -O "http://download.virtualbox.org/virtualbox/${version}/${iso}" &&
  mount "$iso" -o loop /mnt &&
  /mnt/VBoxLinuxAdditions.run --nox11
}

cleanup() {
  rm -f "$iso"
}

main() {

  local version iso

  install_deps &&
  install_latest_vbox_guest &&
  cleanup
}

main "$@"
