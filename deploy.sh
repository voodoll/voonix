#!/bin/sh

hostname=$1

# script to deploy systems
sudo nix \
    --experimental-features "nix-command flakes" \
    run github:nix-community/disko -- \
    --mode disko ./modules/system/disko.nix

sudo nixos-install --root /mnt --flake ./#$hostname

echo "instalation done! you may now reboot"
