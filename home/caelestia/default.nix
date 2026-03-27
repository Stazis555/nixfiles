{ inputs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];
  programs = {
    caelestia = {
      enable = true;
      systemd = {
        enable = false; # if you prefer starting from your compositor
        target = "graphical-session.target";
        environment = [ ];
      };
      settings = {
        general.idle.timeouts = [ ];
        border.thickness = 0;
        border.rounding = 0;
        bar.status = {
          showBattery = false;
          showAudio = true;
        };
        services = {
          useTwelveHourClock = false;
        };
        osd = {
          enable = true;
          enableMicrophone = true;
          enableBrightness = false;
        };
        # paths.wallpaperDir = "~/Images";
      };
      cli = {
        enable = true; # Also add caelestia-cli to path
        settings = {
          theme.enableGtk = false;
        };
      };
    };
    # fuzzel = {
    #   enable = true;
    # };
  };
  services = {
    # cliphist = {
    #   enable = true;
    # };
  };
}
