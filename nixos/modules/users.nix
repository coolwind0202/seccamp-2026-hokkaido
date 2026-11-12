# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`onfig, lib, pkgs, ... }:
{ pkgs, lib, ... }: {
  users.users.user = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
      "docker"
    ];
    shell = pkgs.zsh;
    initialPassword = "user";
  };
}

