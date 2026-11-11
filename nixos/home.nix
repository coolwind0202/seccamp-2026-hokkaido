# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`onfig, lib, pkgs, ... }:
{ pkgs, lib, ... }: {
  home.packages = [
    pkgs.containerlab
    pkgs.vim
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable  = true;
      plugins = [
        "git"
      ];
      theme   = "robbyrussell";
    }; 
    shellAliases = {
      proxy = ''sudo http_proxy="socks5h://127.0.0.1:1080" https_proxy="socks5h://127.0.0.1:1080" ALL_PROXY="socks5h://127.0.0.1:1080"'';
    };
  };
  programs.git = {
    enable    = true;
    settings.user = {      
      name  = "coolwind0202";
      email = "erable0226@gmail.com";
    };
  };

  home.stateVersion = "26.11";
}

