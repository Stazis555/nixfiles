
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, oldnixpkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixos
    ];

  # Docker
  virtualisation.docker.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Tallinn";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "et_EE.UTF-8";
    LC_IDENTIFICATION = "et_EE.UTF-8";
    LC_MEASUREMENT = "et_EE.UTF-8";
    LC_MONETARY = "et_EE.UTF-8";
    LC_NAME = "et_EE.UTF-8";
    LC_NUMERIC = "et_EE.UTF-8";
    LC_PAPER = "et_EE.UTF-8";
    LC_TELEPHONE = "et_EE.UTF-8";
  };

  # services.flatpak.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };

    enable = true;
    videoDrivers = [ "amdgpu" ];
  };

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    autoLogin.enable = true;
    autoLogin.user = "stazis";
  };

  programs.zsh.enable = true;

  security.polkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.stazis = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "stazis";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "stazis";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # neovim
    # kitty
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

    hyprpaper
    geeqie

    git
    fzf
    zoxide
    jq
    # thefuck
    nushell

    waybar
    # mako
    unzip
    rofi-wayland
    xdg-desktop-portal-gtk
    gtk4
    gtk3
    wine-wayland
    winetricks
    gparted
    wl-clipboard
    # hyprcursor
    pavucontrol
    # pw-volume
    wlogout
    brave

    bluez
    bluez-tools
    bluez-alsa

    k9s
    kubeseal
    fluxcd
    kubectl
    direnv

    vulkan-loader
    lutris
    wowup-cf
    chiaki
    godot_4
    solaar
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    steam.enable = true;

    _1password-gui.enable = true;
    thunar.enable = true;
    xfconf.enable = true;

  };

  # sound.enable = true;
  # sound.mediaKeys.enable = true;

  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "true";

  fonts.packages = with pkgs; [
    fira-code
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  fileSystems = {
    "/storage" = {
      device = "/dev/nvme0n1p2";
      fsType = "ext4";
      options = [
        "defaults"
        "nofail"
      ];
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-hyprland];
      config = {
        common.default = ["gtk"];
      };
    };
  };
}
