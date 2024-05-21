#!/usr/bin/env nu
def main [system] {
    sudo nixos-rebuild build-vm --impure --flake $".#($system)"
}

