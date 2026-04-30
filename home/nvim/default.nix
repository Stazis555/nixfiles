{ pkgs, ... }:
{
  xdg.configFile = {
    "nvim/".source = ./config;
  };

  programs = {
    neovim = {
      enable = true;
      plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
      withPython3 = false;
      withRuby = false;
      defaultEditor = true;
      extraPackages = with pkgs; [
        lua-language-server
        tree-sitter
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
