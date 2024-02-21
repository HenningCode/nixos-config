{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {

      window = {
        padding = {
          x = 15;
          y = 15;
        };
        blur = true;
        opacity = 0.9;
      };

      cursor.style = {
        shape = "Beam";
        blinking = "On";
      };

      font.normal = {
        family = "Fira Code";
        style = "Retina";
      };

      colors = with config.colorScheme.colors; {
        primary.background = "0x${base00}";
        primary.foreground = "0x${base06}";
        normal = {
          black = "0x${base00}";
          red = "0x${base08}";
          green = "0x${base0B}";
          yellow = "0x${base0A}";
          blue = "0x${base0D}";
          magenta = "0x${base0E}";
          cyan = "0x${base0C}";
          white = "0x${base06}";
        };
        bright = {
          black = "0x${base00}";
          red = "0x${base08}";
          green = "0x${base0B}";
          yellow = "0x${base09}";
          blue = "0x${base0D}";
          magenta = "0x${base0E}";
          cyan = "0x${base0C}";
          white = "0x${base06}";
        };
        cursor.cursor = "0x${base06}";
        cursor.text = "0x${base06}";
      };
    };
  };
}

