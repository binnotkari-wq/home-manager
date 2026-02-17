{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.username = "benoit";
  home.homeDirectory = "/home/benoit";
  home.stateVersion = "25.11";
  home.language.base = "fr_FR.UTF-8";


  imports = [
    ./modules/CLI_user-tools.nix
    ./modules/dotfiles.nix
    ./modules/git-autosync_systemd.nix
    ./modules/gnome_apps.nix
    ./modules/shell-scripts.nix
  ];


  # --- CREATION DES DOSSIERS STANDARDS XDG ---
  # Ces scripts s'exécutent à la fin de chaque 'home-manager switch'
  home.activation = {
    setupUserDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if [ -e /etc/NIXOS ]; then
        echo "❄️ NixOS détecté : Mise à jour des xdg-user-dirs..."
        # On s'assure que l'outil est disponible et on l'exécute
        ${pkgs.xdg-user-dirs}/bin/xdg-user-dirs-update
      else
        echo "🐧 Distribution hôte différente de NixOS, saut de l'étape xdg."
      fi
    '';
  };
}

