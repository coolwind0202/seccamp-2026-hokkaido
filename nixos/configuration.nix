# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`onfig, lib, pkgs, ... }:
{ pkgs, lib, ... }: {
  nixpkgs.config.allowUnfree = true;

  imports =
    [
      ./modules/core.nix
      ./modules/network.nix
      ./modules/users.nix
    ];
}

