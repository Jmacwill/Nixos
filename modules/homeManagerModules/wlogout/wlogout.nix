{ lib, config, ... }:

{
  options = {
    wlogout.enable = 
      lib.mkEnableOption "enables wlogout";
  };

  config = lib.mkIf config.wlogout.enable {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        "label" = "reboot";
        "action" = "sleep 1; systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "logout";
        "action" = "sleep 1; hyprctl dispatch exit";
        "text" = "Exit";
        "keybind" = "e";
      }
      {
        "label" = "suspend";
        "action" = "sleep 1; systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "lock";
        "action" = "sleep 1; hyprlock";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "hibernate";
        "action" = "sleep 1; systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
    ];
    style = ''
      * {
        font-family: "JetBrainsMono NF", FontAwesome, sans-serif;
      	background-image: none;
      	transition: 20ms;
      }
      window {
      	background-color: rgba(12, 12, 12, 0.1);
      }
      button {
      	color: #${config.lib.stylix.colors.base05};
        font-size:20px;
        background-repeat: no-repeat;
      	background-position: center;
      	background-size: 25%;
      	border-style: solid;
      	background-color: rgba(12, 12, 12, 0.5);
      	border: 3px solid #${config.lib.stylix.colors.base05};
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      }
      button:focus,
      button:active,
      button:hover {
        color: #${config.lib.stylix.colors.base0A};
        background-color: rgba(12, 12, 12, 0.5);
        border: 3px solid #${config.lib.stylix.colors.base0A};
      }
      #logout {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("../../Nixos/modules/homeManagerModules/wlogout/logout.png"));
      }
      #suspend {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("../../Nixos/modules/homeManagerModules/wlogout/suspend.png"));
      }
      #shutdown {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("../../Nixos/modules/homeManagerModules/wlogout/shutdown.png"));
      }
      #reboot {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("../../Nixos/modules/homeManagerModules/wlogout/reboot.png"));
      }
      #lock {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("../../Nixos/modules/homeManagerModules/wlogout/lock.png"));
      }
      #hibernate {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("../../Nixos/modules/homeManagerModules/wlogout/hibernate.png"));
      }
    '';
  };
  };
}
