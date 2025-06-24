
{ pkgs, ... }:
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
      xwayland.enable = true;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "true";
  environment.systemPackages = with pkgs; [
    hyprpaper
    # hyprcursor
    rofi-wayland
    xdg-desktop-portal-gtk
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
      extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-hyprland];
      config = {
        common.default = ["gtk"];
      };
    };
  };
}
