{ pkgs, inputs, ... }:
{
  # xdg.configFile."hypr/hyprpaper.conf".source = ./config/hyprpaper.conf;

  wayland.windowManager.hyprland = {
    enable = true;

    # plugins = [
    #   inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.csgo-vulkan-fix
    # ];

    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";
      "$mainMod" = "SUPER";

      monitor = [
        "HDMI-A-1,3440x1440@100,0x0,1"
      ];

      "exec-once" = [
        "mako"
        "hyprpaper"
        "hyprctl setcursor rose-pine-hyprcursor 28"
        "systemctl --user start hyprpolkitagent"
        "/home/stazis/vesktop.sh"
        "[workspace 4 silent] Telegram"
        "steam"
        "[workspace 6 silent] 1password"
        "sleep 1 && caelestia shell -d"
        "amixer -c $(arecord -l | rg Blue | rg -o 'card [0-9]+' | tr -d 'card ') set \"Mic\" playback 5%"
        "[workspace 6 silent] qbittorrent"
        "wl-paste --watch cliphist store"
      ];

      env = [
        "XCURSOR_SIZE,28"
        "HYPRCURSOR_SIZE,28"
      ];

      general = {
        gaps_in = 5;
        gaps_out = "0,0,0,10";
        border_size = 1;
        "col.active_border" = "rgba(ff7eb9ee) rgba(ff65a3ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = { };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
        enable_anr_dialog = false;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = -0.55;
        repeat_delay = 220;
        repeat_rate = 35;
        touchpad = {
          natural_scroll = false;
        };
      };

      bind = [
        "$mainMod, W, global, caelestia:launcher"
        "$mainMod, Q, exec, $terminal"
        "$mainMod SHIFT, C, killactive,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        # "$mainMod, J, togglesplit,"
        "$mainMod, SPACE, exec, rofi -show drun"
        "$mainMod SHIFT, SPACE, exec, rofi -show run"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod ALT, S, exec, grim -g \"$(slurp)\" - | wl-copy"
        "$mainMod ALT SHIFT, S, exec, grimblast --freeze copy area | grim"
        "$mainMod, F, fullscreen"
        "SUPER, C, exec, caelestia clipboard"
        "$mainMod, Y, exec, amixer -c $(arecord -l | rg Blue | rg -o 'card [0-9]+' | tr -d 'card ') sset 'Mic' playback 5%+ | notify-desktop -u low \"Mic volume: $(amixer -c $(arecord -l | rg Blue | rg -o 'card [0-9]+' | tr -d 'card ') get 'Mic' | rg -o '[0-9]+%' | head -1)\""
        "$mainMod SHIFT, Y, exec, amixer -c $(arecord -l | rg Blue | rg -o 'card [0-9]+' | tr -d 'card ') sset 'Mic' playback 5%- | notify-desktop -u low \"Mic volume: $(amixer -c $(arecord -l | rg Blue | rg -o 'card [0-9]+' | tr -d 'card ') get 'Mic' | rg -o '[0-9]+%' | head -1)\""
        "SUPER, Period, exec, pkill fuzzel || caelestia emoji -p"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 2%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 2%-"
      ];

    };

    extraConfig = ''
      windowrule {
          name = windowrule-1
          suppress_event = maximize
          match:class = .*
      }

      windowrule {
          name = windowrule-2
          no_initial_focus = on
          match:class = (bevy)
      }

      windowrule {
          name = windowrule-3
          workspace = 4 silent
          no_initial_focus = on
          match:class = (vesktop)
      }

      windowrule {
          name = windowrule-4
          workspace = 9 silent
          no_initial_focus = on
          match:class = (steam)
      }

      windowrule {
          name = windowrule-5
          workspace = 8 silent
          match:class = ^(steam_app_.*|.*[Ww]ine.*)$
      }

      windowrule {
          name = windowrule-6
          workspace = unset
          match:class = (steam)
          match:title = ^(notification)(.*)$
      }

      device {
          name = wacom-intuos-pro-s-pen
          output = DP-1
      }
    '';
  };

  home.packages = with pkgs; [
    grim
    slurp
    grimblast

    hyprpolkitagent

    rose-pine-cursor
    rose-pine-hyprcursor
  ];
}
