#!/usr/bin/env nu

let host = (sys).host.hostname

sudo nixos-rebuild --impure --flake $".#($host)" switch
