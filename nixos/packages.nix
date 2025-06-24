{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    k9s
    kubeseal
    fluxcd
    kubectl
    direnv

    telegram-desktop
    firefox-wayland
    vesktop
    # (vesktop.overrideAttrs(oldAttrs: {
    #     version = "1.5.4";
    #     # patches = [];
    #     # phases = ["postConfigure" "preBuild" "buildPhase" "postBuild" "installPhase" "postFixup"];
    #     src = fetchFromGitHub {
    #       owner = "Vencord";
    #       repo = "Vesktop";
    #       rev = "v1.5.4";
    #       hash = "sha256-zvyDKgNTRha7Z7KGAA7x9LRJrL+1zyb5TZEFFK8Ffrc=";
    #   };
    #   pnpmDeps = pnpm_9.fetchDeps {
    #     hash = "sha256-GSAOdvd8X4dQNTDZMnzc4oMY54TKvdPuAOMb6DRzCEM=";
    #   };
    # }))
    lm_sensors
    lsof
    keymapp
    obsidian
    syncthing
    qbittorrent

    git
    fzf
    zoxide
    jq
    # nushell

    geeqie

    unzip
    brave

    lutris
    wowup-cf
    chiaki
    godot_4
    solaar
  ];
}
