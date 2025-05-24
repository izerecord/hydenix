{
  description = "template for hydenix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hydenix = {
      url = "github:richen604/hydenix";
    };

    # Nix-index-database - for comma and command-not-found
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { ... }@inputs:
    let
      # HOSTNAME = "nixdesktop";

      # hydenixConfig = inputs.hydenix.inputs.hydenix-nixpkgs.lib.nixosSystem {
      #   inherit (inputs.hydenix.lib) system;
      #   specialArgs = {
      #     inherit inputs;
      #   };
      #   modules = [
      #     ./configuration.nix
      #   ];
      # };

      # Create a function to generate host configurations
      mkHost =
        hostname:
        inputs.hydenix.inputs.hydenix-nixpkgs.lib.nixosSystem {
          inherit (inputs.hydenix.lib) system;
          specialArgs = {
            inherit inputs;
            # hostname = hostname;
          };
          modules = [
            ./hosts/${hostname}
          ];
        };
    in
    {
      # nixosConfigurations.nixos = hydenixConfig;
      # nixosConfigurations.${HOSTNAME} = hydenixConfig;
      nixosConfigurations = {
        nixdesktop = mkHost "nixdesktop";
        nixthinker = mkHost "nixthinker";
      };
    };
    
}
