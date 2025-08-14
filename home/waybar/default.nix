{ config, lib, pkgs, ... }: 
with lib;
let
  cfg = config.stazis.waybar;
in {
  options = {
    stazis.waybar = {
      enable = mkEnableOption "waybar";
      style = mkOption {
        type = types.str;
        default = "windows_style";
      };
    };
  };
  config = mkIf cfg.enable {
    # home.packages = with pkgs; [
    #   pwvucontrol
    # ];
    xdg.configFile = {
      "waybar/config".source = ./${cfg.style}/config.jsonc;
      "waybar/style.css".source = ./${cfg.style}/style.css;
      "waybar/mic-playback.sh".source = ./mic-playback.sh;
    };
  };
}
