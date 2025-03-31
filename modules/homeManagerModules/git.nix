{ lib, config, ... }:

{
  options = {
    git.enable =
      lib.mkEnableOption "enables git configuration";
  };

  config = lib.mkIf config.git.enable {
  programs.git = {
    enable = true;
    userName = "jmacwill";
    userEmail = "jonathan.macwilliams@gmail.com";
    extraConfig.credential.helper = "store";
  };
  };
}
