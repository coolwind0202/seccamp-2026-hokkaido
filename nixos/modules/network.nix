# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`onfig, lib, pkgs, ... }:
{ pkgs, lib, ... }: {
  networking = {
    hostName = "mc26do";
    networkmanager.enable = true;

    interfaces.end0 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address      = "192.168.100.1";
          prefixLength = 24;
        }
      ];
    };
    firewall.interfaces.end0 = {
      allowedUDPPorts = [67 5353];
    };
  };

  services.dnsmasq = {
    enable = true;
    settings = {
      interface  = "end0";
      dhcp-range = "192.168.100.2,192.168.100.254";
      dhcp-option = [
        "option:router"
        "option:dns-server"
      ];
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true; 
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
    }; 
  };

  services.openssh.enable = true;
}

