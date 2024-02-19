{ config, lib, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      padding = {
        x = 5;
        y = 5;
      };
    };
  };

}

