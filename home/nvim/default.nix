{ pkgs, ... }:
{
  xdg.configFile = {
    "nvim/".source = ./config;
  };

  programs = {
    neovim = {
      enable = true;
      withPython3 = false;
      withRuby = false;
      defaultEditor = true;
      extraPackages = with pkgs; [
        lua-language-server
        nodejs
        stylua
        rust-analyzer
        cargo
        rustc
        nixd
        typescript-language-server
      ];
    };
    ripgrep = {
      enable = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
