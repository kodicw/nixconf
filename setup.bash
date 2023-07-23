#!/bin/bash

sudo mv /etc/nixos /etc/nixos.backup && \
sudo git clone git@github.com:kodicw/nixconf.git /etc/nixos && \
sudo cp /etc/nixos.backup/hardware-configuration.nix /etc/nixos/configuration.nix
