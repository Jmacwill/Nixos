# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:

#removed config

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixosModules
      ../../wm/direnv.nix
       
   ];

  #enable hardware stuff
  audio.enable = true;
  bootloader.enable = true;
  bluetooth.enable = true;
  zsh.enable = true;
  amdgpu.enable = true;
  networkingModule.enable = true;
  locale.enable = true;
  laptop.enable = true;
  stylixModule.enable = true;
  users.enable = true;

  networking.hostName = "nixtop"; # Define your hostname.
 
  environment.systemPackages = with pkgs; [
  #  wget
  #  nvtopPackages.amd
  ]; 

  programs.git.enable = true;
  services.openssh.enable = true;

  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  #nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  #pkgs.mkShell = {
  #  buildInputs = with pkgs; [
  #    rnix-lsp
  #  ];
  #};

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
     jonathan = import ../../home.nix;
    };
  };

}
