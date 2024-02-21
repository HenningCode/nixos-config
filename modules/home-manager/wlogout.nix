{ pkgs, user, theme, ... }:

{

  home.packages = [ powerMenu ];
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "lock";
        "action" = "gtklock";
        "keybind" = "l";
      }
      {
        "label" = "reboot";
        "action" = "reboot";
        "keybind" = "r";
      } 
      {
        "label" = "shutdown";
        "action" = "poweroff";
        "keybind" = "s";
      }
    ];
  };
}