{
  description = "Seccamp26 Hokkaido Flake (Raspberry pi 4)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.mc26do = nixpkgs.lib.nixosSystem {
      modules = [
	./nixos/hardware-configuration.nix
        ./nixos/modules/default.nix
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
