{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    home-manager.url = "github:nix-community/home-manager/master";
  };
  # ...

  outputs = inputs @ {
    home-manager,
    hyprpanel,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux"; # change to whatever your system should be
  in {
    homeConfigurations."akmal" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          inputs.hyprpanel.overlay
        ];
      };
      extraSpecialArgs = {
        inherit system;
        inherit inputs;
      };
    };
  };
}
