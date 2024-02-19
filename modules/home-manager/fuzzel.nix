{ config, lib, pkgs, ...}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      colors.background = "0x1d2021";
      colors.foreground = "0xd4be98";
    };
  };
}