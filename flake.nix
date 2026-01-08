# Usage:
#   Lima VM: home-manager switch --flake .#lima
#   macOS:   home-manager switch --flake .#mac
{
    description = "Home Manager configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }:
        let
        mkHome = { system, username, homeDirectory }: home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [{
                home.username = username;
                home.homeDirectory = homeDirectory;
                home.stateVersion = "24.11";
                programs.home-manager.enable = true;
                home.packages = with nixpkgs.legacyPackages.${system}; [
                    fish
                    neovim
                    ripgrep
                    delta
                    bat
                ];
            }];
        };
    in {
        homeConfigurations = {
            "lima" = mkHome { system = "aarch64-linux"; username = "lucy"; homeDirectory = "/home/lucy.linux"; };
            "mac" = mkHome { system = "aarch64-darwin"; username = "lucy"; homeDirectory = "/Users/lucy"; };
        };
    };
}
