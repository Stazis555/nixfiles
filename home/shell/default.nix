{ lib, ...}:
{
  home.file = {
    ".zshrc".source = ./.zshrc;
  };

  programs = {
    kitty = {
      enable = true;
      # font.name = "MartianMonoNerdFontMono";
      extraConfig = ''
        # font_family family="FiraCodeNerdFontMono" style="Med"
        # font_family SauceCodePro Nerd Font Mono 
        font_family FiraCode Nerd Font Mono Med
        # font_family FiraCode Nerd Font Mono Med
        bold_font FiraCode Nerd Font Mono Bold
        # italic_font family="DaddyTimeMono Nerd Font" style="Mono"
        italic_font RobotoMono Nerd Font It
        # italic_font UbuntuSansMono NF Italic
        bold_italic_font RobotoMono Nerd Font Bd It
        font_size 12.0
        # font_family Fira Code Nerd Font Mono
        # font_fallback Fira Code Nerd Font Mono
        # font_weight normal
        # font_style bold
        background_opacity 0.85
        background_blur 64

      '';
      settings = {
        editor = "nvim";
      };
    };
    zsh = {
      enable = false;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        format = lib.concatStrings [
          "[](#9A348E)"
          "$os"
          "$username"
          "$nix_shell"
          "[](bg:#DA627D fg:#9A348E)"
          "$directory"
          "[](fg:#DA627D bg:#FCA17D)"
          "$git_branch"
          "$git_status"
          "[](fg:#FCA17D bg:#86BBD8)"
          # "$c"
          # "$elixir"
          # "$elm"
          "$golang"
          # "$gradle"
          "$haskell"
          # "$java"
          # "$julia"
          "$nodejs"
          # "$nim"
          "$rust"
          # "$scala"
          "[](fg:#86BBD8 bg:#06969A)"
          "$docker_context"
          "[](fg:#06969A bg:#33658A)"
          "$time"
          "[ ](fg:#33658A)"
          "\n$character"
        ];
        username = {
          show_always = true;
          style_user = "bg:#9A348E";
          style_root = "bg:#9A348E";
          format = "[$user ]($style)";
          disabled = false;
        };
        nix_shell = {
          format = "[$symbol ]($style)";
          style = "bg:#9A348E";
          symbol = "❄️";
        };
        os = {
          style = "bg:#9A348E";
          disabled = true; # Disabled by default
        };
        directory = {
          style = "bg:#DA627D";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
          substitutions = {
            "Documents" = "󰈙 ";
            "Downloads" = " ";
            "Music" = " ";
            "Pictures" = " ";
          };
        };
        docker_context = {
          symbol = " ";
          style = "bg:#06969A";
          format = "[ $symbol $context ]($style)";
        };
        git_branch = {
          symbol = "";
          style = "bg:#FCA17D";
          format = "[ $symbol $branch ]($style)";
        };
        git_status = {
          style = "bg:#FCA17D";
          format = "[$all_status$ahead_behind ]($style)";
        };
        golang = {
          symbol = " ";
          style = "bg:#86BBD8";
          format = "[ $symbol ($version) ]($style)";
        };
        haskell = {
          symbol = " ";
          style = "bg:#86BBD8";
          format = "[ $symbol ($version) ]($style)";
        };
        nodejs = {
          symbol = "";
          style = "bg:#86BBD8";
          format = "[ $symbol ($version) ]($style)";
        };
        rust = {
          symbol = "";
          style = "bg:#86BBD8";
          format = "[ $symbol ($version) ]($style)";
        };
        time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format;
          style = "bg:#33658A";
          format = "[ ♥ $time ]($style)";
        };
      };
    };
  };
}
