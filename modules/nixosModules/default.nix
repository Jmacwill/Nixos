{ pkgs, inputs, ... }:

{
  #This imports toggleable options within all hosts. Add new nixosModules, with proper path!
  imports = [
    #Hardware
    ./amdgpu.nix
    ./generic-gpu.nix
    ./laptop.nix
    ./usbModule.nix
    ./spacemouse.nix
    ./printers.nix
    
    #Localization
    ./locale.nix
    ./users.nix
    
    #Software
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./homeManagerModule.nix
    #./steam.nix
    ./stylixModule.nix
    ./zsh.nix

    #Netwoking:
    ./tailscale.nix
    ./nasModule.nix
    ./networkingModule.nix
    ./ssh.nix
  ];


  #All that follows defines host-agnostic system defaults
  environment.systemPackages = with pkgs; [
    vim
    zip
    unzip
    wget
    git
    tree
    dmidecode
    mesa-demos
    gpu-viewer
    curl
    fastfetch
    htop
    wayland-utils
    brightnessctl
    qmk  # keyboard firmware
    hyprshot
    vesktop
    mupdf
    lm_sensors
    vscode
    brave
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # experimental settings enable.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # for nixd
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nixpkgs.config.allowUnfree = true;

  # Configure keymap in X11
  services = {
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
