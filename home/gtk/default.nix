{ pkgs, ... }:
{
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.libsForQt5.breeze-gtk;
      name = "breeze_cursors";
      size = 24;
    };
  };
  home.file.".local/share/icons/default/index.theme".text = ''
    [Icon Theme]
    Inherits=breeze_cursors
  '';
}
