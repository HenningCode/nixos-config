{ config, pkgs, inputs, lib, ... }:

{
  home.username = "henning";
  home.homeDirectory = "/home/henning";

  imports = [
    ../../modules/home-manager/vscode.nix
    ../../modules/home-manager/lf.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/direnv.nix
    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/gtk/default.nix
    ../../modules/home-manager/waybar/default.nix
    ../../modules/home-manager/wlogout.nix
    inputs.nix-colors.homeManagerModules.default
  ];

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
 
  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfreePredicate = _: true;
  nixpkgs.config.allowUnfree = true; 
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    hello
    discord
    jetbrains.rust-rover
    neofetch
    fira-code
    fira-code-symbols
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
    rebuild = "sudo nixos-rebuild switch --flake /home/henning/nixos/#default";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs.git = {
     enable = true;
     userName = "HenningCode";
     userEmail = "henningwilmer@yahoo.de";
  };
    
}
