{ config, pkgs, inputs, lib, ... }:

{
  home.username = "henning";
  home.homeDirectory = "/home/henning";

  imports = [
    ../../modules/home-manager/vscode.nix
    ../../modules/home-manager/lf.nix
  ];

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
 
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfreePredicate = _: true;
  nixpkgs.config.allowUnfree = true; 
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    hello
    discord
    jetbrains.rust-rover
    neofetch
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  
  };

  systemd.user.sessionVariables = {
    EDITOR = "vim";
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.shellAliases = {
    "rebuild" = "sudo nixos-rebuild switch --flake /home/henning/nixos/#default";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs.git = {
     enable = true;
     userName = "HenningCode";
     userEmail = "henningwilmer@yahoo.de";
  };
  
  gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.name = "GruvBoxPlus";
  };
    
}
