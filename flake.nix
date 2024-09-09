{
  description = "404Gh0st's NixOS Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nur.url = "github:nix-community/nur";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
    ];
    username = "404gh0st";
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};

    # NixOS configuration entrypoint
    # 'nixos-rebuild switch --flake .#your-hostname'
    nixosConfigurations = {
      jergal = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs username;};
        modules = [
          catppuccin.nixosModules.catppuccin
          ./hosts/jergal
          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs username;};
            home-manager.users.${username} = {
              imports = [
                ./hosts/jergal/home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          }
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # home-manager switch --flake .#your-username@your-hostname'
    homeConfigurations = {
      "${username}@jergal" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs username;};
        modules = [
          ./modules/home-manager
          catppuccin.homeManagerModules.catppuccin
        ];
      };
    };
  };
}
