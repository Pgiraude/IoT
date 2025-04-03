#!/bin/bash

sudo apt autoremove
sudo apt autoclean
sudo apt clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY