{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    k9s
    kubeseal
    fluxcd
    kubectl
    direnv

    telegram-desktop
    firefox
    chromium
    vesktop
    # (vesktop.overrideAttrs(oldAttrs: {
    #     version = "1.5.7";
    #     # patches = [];
    #     # phases = ["postConfigure" "preBuild" "buildPhase" "postBuild" "installPhase" "postFixup"];
    #     src = fetchFromGitHub {
    #       owner = "Vencord";
    #       repo = "Vesktop";
    #       rev = "v1.5.7";
    #       hash = "sha256-2YVaDfvhmuUx2fVm9PuMPQ3Z5iu7IHJ7dgF52a1stoM=";
    #   };
    #   pnpmDeps = pnpm_10.fetchDeps {
    #     pname = "vesktop";
    #     version = "1.5.7";
    #     fetcherVersion = 2;
    #     hash = "sha256-C05rDd5bcbR18O6ACgzS0pQdWzB99ulceOBpW+4Zbqw=";
    #   };
    # }))
    lm_sensors
    lsof
    keymapp
    # obsidian
    # syncthing
    qbittorrent

    git
    fzf
    zoxide
    jq
    openssl
    # nushell

    geeqie

    unzip
    brave

    spotify
    lutris
    wowup-cf
    # chiaki
    godot_4
    solaar

    mixxx
    spotdl
    ffmpeg
    alsa-utils

    # inputs.caelestia-shell.packages.${system}.default
    # inputs.caelestia-cli.packages.${system}.default
    #
    # clipse

    fuzzel
    cliphist
    notify-desktop

  ];

  services.playerctld.enable = true;
}
