{ pkgs, inputs, ... }:
{
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

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      xwayland.enable = true;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "true";
  environment.systemPackages = with pkgs; [
    gamescope # gamescope -w 2560 -h 1440 -W 3440 -H 1440 -f -S fit --backend wayland --force-composition -- %command%
    hyprpaper
    # hyprcursor
    rofi
    xdg-desktop-portal-gtk
    xdg-desktop-portal
    gtk4
    gtk3
    wine-wayland
    winetricks
    wl-clipboard
    wlogout
    gparted
    pavucontrol

    waybar
  ];

  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        # pkgs.xdg-desktop-portal-hyprland
      ];
      config = {
        common.default = [ "gtk" ];
      };
    };
  };
}
