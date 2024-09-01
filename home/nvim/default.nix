{ pkgs, ... }: 
{
  xdg.configFile = {
    "nvim/".source = ./config;
  };

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        lua-language-server
        nodejs
        stylua
        rust-analyzer
        cargo
        rustc
        nixd
      ] ++ [nodePackages.typescript-language-server];
    };
    ripgrep = {
      enable = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
