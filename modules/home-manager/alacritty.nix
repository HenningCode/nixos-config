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

      colors = {
        primary.background = "0x1d2021";
        primary.foreground = "0xd4be98";
        normal = {
          black = "0x32302f";
          red = "0xea6962";
          green = "0xa9b665";
          yellow = "0xd8a657";
          blue = "0x7daea3";
          magenta = "0xd3869b";
          cyan = "0x89b482";
          white = "0xd4be98";
        };
        bright = {
          black = "0x32302f";
          red = "0xea6962";
          green = "0xa9b665";
          yellow = "0xd8a657";
          blue = "0x7daea3";
          magenta = "0xd3869b";
          cyan = "0x89b482";
          white = "0xd4be98";
        };
      };
    };
  };
}

