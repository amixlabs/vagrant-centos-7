#!/usr/bin/env bash


main () {
  # Up with provision
  vagrant up &&
  # Shutdown
  vagrant halt &&
  # Package the new VM
  vagrant package --output centos-7.box
}

main "$@"
