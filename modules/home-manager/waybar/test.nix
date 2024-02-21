{
  pkgs,
  config,
  ...
}: let

  workspaces = {
    format = "{icon}";
    format-icons = {
      "1" = "";
      "2" = "";
      "3" = "";
      active = "";
      default = "";
      urgent = "";
    };
    on-click = "activate";
    # persistent_workspaces = { "*" = 10; };
  };

  mainWaybarConfig = {
    mod = "dock";
    layer = "top";
    gtk-layer-shell = true;
    height = 30;
    position = "top";

    modules-left = ["custom/logo" "hyprland/workspaces"];
    modules-right = [
      "network"
      "pulseaudio"
      "custom/date"
      "clock"
    ];

    "wlr/workspaces" = workspaces;
    "hyprland/workspaces" = workspaces;

    clock = {
      format = "  {:%H:%M} ";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    };


    network = {
      format-disconnected = " Disconnected";
      format-ethernet = "󱘖 Wired";
      format-linked = "󱘖 {ifname} (No IP)";
      format-wifi = "󰤨 {essid}";
      interval = 5;
      max-length = 30;
      tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
    };

    pulseaudio = {
      format = "{icon}  {volume}%";
      format-icons = {
        car = " ";
        default = ["" "" ""];
        hands-free = " ";
        headphone = " ";
        headset = " ";
        phone = " ";
        portable = " ";
      };
      format-muted = "婢 {volume}%";
      on-click = "pavucontrol -t 3";
      on-click-middle = "pamixer -t";
      on-scroll-down = "pamixer -d 5";
      on-scroll-up = "pamixer -i 5";
      scroll-step = 5;
      tooltip-format = "{icon} {desc} {volume}%";
    };

  };

  css = ''
    * {
        border: none;
        border-radius: 0px;
        font-family: "JetBrainsMono Nerd Font";
        font-weight: bold;
        font-size: 14px;
        min-height: 0px;
    }

    window#waybar {
    }

    tooltip {
        background: @theme_unfocused_base_color;
        color: @theme_text_color;
        border-radius: 10px;
        border-width: 1px;
        border-style: solid;
        border-color: shade(alpha(@theme_text_colors, 0.9), 1.25);
    }

    #workspaces button {
        box-shadow: none;
    	text-shadow: none;
        padding: 0px;
        border-radius: 7px;
        padding-right: 0px;
        padding-left: 4px;
        margin-right: 7px;
        margin-left: 7px;
        color: @theme_text_color;
        animation: gradient_f 2s ease-in infinite;
        transition: all 0.2s cubic-bezier(.55,-0.68,.48,1.682);
    }

    #workspaces button.active {
        color: @accent_color;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
    }

    #workspaces button:hover {
        color: @accent_color;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
    }

    #cpu,
    #memory,
    #custom-power,
    #clock,
    #workspaces,
    #window,
    #custom-updates,
    #network,
    #bluetooth,
    #pulseaudio,
    #custom-wallchange,
    #custom-mode,
    #tray {
        color: @theme_text_color;
        background: shade(alpha(@theme_text_colors, 0.9), 1.25);
        opacity: 1;
        padding: 0px;
        margin: 3px 3px 3px 3px;
    }

    #custom-battery {
        color: @green_1
    }

    /* resource monitor block */

    #cpu {
        border-radius: 10px 0px 0px 10px;
        margin-left: 25px;
        padding-left: 12px;
        padding-right: 4px;
    }

    #memory {
        border-radius: 0px 10px 10px 0px;
        border-left-width: 0px;
        padding-left: 4px;
        padding-right: 12px;
        margin-right: 6px;
    }


    /* date time block */
    #clock {
        color: @yellow_1;
        padding-left: 12px;
        padding-right: 12px;
    }


    /* workspace window block */
    #workspaces {
        border-radius: 9px 9px 9px 9px;
        background: mix(@theme_unfocused_base_color,white,0.1);
    }

    #window {
        /* border-radius: 0px 10px 10px 0px; */
        /* padding-right: 12px; */
    }


    /* control center block */
    #custom-updates {
        border-radius: 10px 0px 0px 10px;
        margin-left: 6px;
        padding-left: 12px;
        padding-right: 4px;
    }

    #network {
        color: @purple_1;
        padding-left: 4px;
        padding-right: 4px;
    }

    #language {
        color: @orange_1;
        padding-left: 9px;
        padding-right: 9px;
    }

    #bluetooth {
        color: @blue_1;
        padding-left: 4px;
        padding-right: 0px;
    }

    #pulseaudio {
        color: @purple_1;
        padding-left: 4px;
        padding-right: 4px;
    }

    #pulseaudio.microphone {
        color: @red_1;
        padding-left: 0px;
        padding-right: 4px;
    }


    /* system tray block */
    #custom-mode {
        border-radius: 10px 0px 0px 10px;
        margin-left: 6px;
        padding-left: 12px;
        padding-right: 4px;
    }

    #custom-logo {
        margin-left: 6px;
        padding-right: 4px;
        color: @blue_1;
        font-size: 16px;

    }

    #tray {
        padding-left: 4px;
        padding-right: 4px;
    }
  '';
in {
  programs.waybar = {
    enable = true;
    # package = pkgs.waybar.overrideAttrs (oldAttrs: {
    #   mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    # });
    style = css;
    settings = {mainBar = mainWaybarConfig;};
  };
}