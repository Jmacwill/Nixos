{
  description = "Jonathan config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # NixOS configuration - this is an attempt to setup the path for the Nixos LSP Module.  It no worky for some reason
  
    # nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
     
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    stylix = {
      url = "github:danth/stylix";
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
    nixosConfigurations.nixtop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixtop/configuration.nix
        inputs.home-manager.nixosModules.default
        inputs.stylix.nixosModules.stylix
      ];
    };
  };
}
