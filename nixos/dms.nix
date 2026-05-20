{ inputs, pkgs, ... }:
{
  imports = [ inputs.dms-plugin-registry.modules.default ];
  programs.dms-shell = {
    enable = true;
    plugins = {
      mpvpaperWallpaper.enable = true;
      wallpaperCarousel.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    mpvpaper
    waypaper
  ];
}
