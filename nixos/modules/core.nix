# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`onfig, lib, pkgs, ... }:
{ pkgs, lib, ... }: {
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  # Keyboard Configurations
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap       = "jp106";
  };
  services.xserver.xkb = {
    layout = "jp";
    model  = "jp106";
  };

  # Others
  time.timeZone = "Asia/Tokyo";

  programs.zsh.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  system.stateVersion = "26.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
