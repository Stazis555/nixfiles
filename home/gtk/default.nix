{ pkgs, ... }:
{
  gtk = {
    enable = true;
    # cursorTheme = {
    #   # package = pkgs.rose-pine-cursor;
    #   name = "breeze_cursors";
    #   size = 24;
    # };
  };
  home.file.".local/share/icons/default/index.theme".text = ''
    [Icon Theme]
    Inherits=BreezeX-RosePine-Linux
  '';
}
