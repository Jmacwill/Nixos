{
  description = "Jonathan config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
     
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      };

     nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };  
  #  pkgs.mkShell {
  #     buildInputs = with pkgs; [
  #        rnix-lsp
  #];
#}

    };

  
  
  outputs = { self, nixpkgs, ... }@inputs: { 
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations = {
      nixtop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixtop/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
