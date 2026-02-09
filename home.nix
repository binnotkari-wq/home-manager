{ config, pkgs, ... }:

{

  # installer home-amanger de façon indépendante avec :
  # 1. : nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager # On ajoute le dépôt Home Manager 
  # 2. : nix-channel --update # On met à jour les dépôts 
  # 3. : nix-shell '<home-manager>' -A install
  
  # 4. : au premier "home-manager switch -f /home/benoit/Mes-Donnees/Git/home-manager/home.nix", il s'auto installera indépendamment
  programs.home-manager.enable = true;
  

  home.username = "benoit";
  home.homeDirectory = "/home/benoit";
  home.stateVersion = "25.11";


  imports = [
    ./modules/git-autosync_systemd.nix
    ./modules/session_variables.nix
    ./modules/dotfiles.nix
    ./modules/shell-scripts.nix
    ./modules/shell_settings.nix
    ./modules/gnome_apps.nix
  ];

  # --- CREATION DES DOSSIERS STANDARDS XDG ---
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}

