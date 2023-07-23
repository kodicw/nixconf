#!/bin/bash

sudo mv /etc/nixos /etc/nixos.backup && \
sudo git clone -b nadia https://github.com/kodicw/nixconf.git /etc/nixos && \
sudo cp /etc/nixos.backup/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
sudo nixos-rebuild switch
