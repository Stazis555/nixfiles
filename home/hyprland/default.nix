{ pkgs, ... }:
{
  xdg.configFile = {
    "hypr/".source = ./config;
  };

  home.packages = with pkgs; [
    grim
    slurp
    grimblast

    hyprpolkitagent

    rose-pine-cursor
    rose-pine-hyprcursor
  ];

  # services.clipse = {
  #   enable = true;
  #   keyBindings = {
  #     choose = "t";
  #     clearSelected = "S";
  #     down = "c";
  #     end = "end";
  #     filter = "/";
  #     home = "home";
  #     more = "?";
  #     nextPage = "right";
  #     prevPage = "left";
  #     preview = " ";
  #     quit = "q";
  #     remove = "x";
  #     selectDown = "ctrl+down";
  #     selectSingle = "s";
  #     selectUp = "ctrl+up";
  #     togglePin = "p";
  #     togglePinned = "tab";
  #     up = "f";
  #     yankFilter = "ctrl+s";
  #   };
  # };
}
