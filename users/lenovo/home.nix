{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./home/eza
    ./home/nvim
    ./home/shell/default-mihhail.nix
  ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    zoxide
    yazi
    fzf
    direnv
    awscli2
    nixfmt
    nerd-fonts.fira-code
    nerd-fonts.roboto-mono
    k9s
    kubectl
    skaffold
    kustomize
    kubernetes-helm
  ];

  home.username = "mihhail";
  home.homeDirectory = "/home/mihhail";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  #home.packages = [
  #  inputs.hyprland-qtutils.packages."${pkgs.system}".default
  #];

  #stazis.waybar.enable = false;
  # stazis.waybar.style = "default";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
