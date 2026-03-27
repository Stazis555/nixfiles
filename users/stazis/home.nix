{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./../../home
  ];

  home.username = "stazis";
  home.homeDirectory = "/home/stazis";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
    inputs.hyprland-qtutils.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];

  stazis.waybar.enable = false;
  # stazis.waybar.style = "default";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  gtk.gtk4.theme = null;
}
