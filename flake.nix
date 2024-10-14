{

  description = "Hetzner devbox flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      # update the machine name "devbox"
      nixosConfigurations.devbox = lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
        };

        modules = [ ./configuration.nix ];
      };
    };
}
