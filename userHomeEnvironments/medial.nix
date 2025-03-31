{  ... }:

{
  # This is the primary interface for a laptop or other single screen
  # device. It is a bit more minimalistic than the desktop version.

  home.username = "jonathan";
  home.homeDirectory = "/home/jonathan";
 
  imports = [
    ../modules/homeManagerModules
  ];
  
  cad.enable = true;
  #firefox.enable = true;
  office.enable = true;
  #research.enable = true;

  rofi.enable = true;
  #hyprland-gaming-monitor.enable = false;
  hyprland.enable = true;
  styling.enable = true;
  waybar.enable = true;
  wlogout.enable = true;
  minecraftClient.enable = true;

  git.enable = true;
  kitty.enable = true;
  #nixvim.enable = true;
  screenshotter.enable = true;
  #scripts.enable = true;

  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; 
}

