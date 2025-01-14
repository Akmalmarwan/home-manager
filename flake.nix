{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    stylix.url = "github:danth/stylix/release-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
  };

  outputs = { home-manager, nixpkgs, stylix, ... }@inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in 
  {
    homeConfigurations.akmal = home-manager.lib.homeManagerConfigurations {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
      ./home.nix
      stylix.homeManagerModules.stylix
      ];
    };

    packages.x86_64-linux.hello = pkgs.hello;
    packages.x86_64-linux.default = pkgs.hello;

  };
}
