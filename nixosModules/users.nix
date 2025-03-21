{ pkgs, lib, config, ... }:

{
  options = {
    users.enable =
      lib.mkEnableOption "user support";
  };

  config = lib.mkIf config.users.enable {
    users.users.jonathan = {
      isNormalUser = true;
      description = "jonathan";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.zsh;
    };
 };
}
