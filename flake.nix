{
  description = "Seccamp26 Hokkaido Flake (Raspberry pi 4)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      commonModules = [
        ./nixos/modules/default.nix
        home-manager.nixosModules.default {
          home-manager =  {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.user = ./nixos/home.nix;
          };
        }
      ];
    in {
      nixosConfigurations.mc26do = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit self; };
	modules = commonModules ++ [
          ./nixos/hardware-configuration.nix
        ]; 
      };

      packages.aarch64-linux.sdImage = (nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit self; };
        modules = commonModules ++ [
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          ./nixos/cache-to-sdcard.nix
        ];
      }).config.system.build.sdImage;
    };
}
