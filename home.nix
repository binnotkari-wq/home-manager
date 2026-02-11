{ config, pkgs, ... }:

{

  # installer home-amanger de façon indépendante avec :
  # 1. OK DANS SCRIPT : nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager # On ajoute le dépôt Home Manager 
  # 2. OK DANS SCRIPT : nix-channel --update # On met à jour les dépôts 
  # 3. OK DANS SCRIPT : nix-shell '<home-manager>' -A install
  # 4. OK DANS SCRIPT : au premier "home-manager switch -f /home/benoit/Mes-Donnees/Git/home-manager/home.nix", il s'auto installera indépendamment
  
  programs.home-manager.enable = true;
  home.username = "benoit";
  home.homeDirectory = "/home/benoit";
  home.stateVersion = "25.11";
  home.language.base = "fr_FR.UTF-8";


  imports = [
    ./modules/git-autosync_systemd.nix
    ./modules/session_variables.nix
    ./modules/dotfiles.nix
    ./modules/shell-scripts.nix
    ./modules/shell_settings.nix
    ./modules/gnome_apps.nix
    ./modules/flatpaks.nix
    ./modules/CLI_user-tools.nix
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



  # --- CREATION DES DOSSIERS STANDARDS XDG ---
  # home.file.".config/user-dirs.locale".text = "fr_FR";
  # xdg.userDirs = {
    # enable = true;
    # createDirectories = true;
    # documents = "$HOME/Documents";
    # download = "$HOME/Téléchargements";
    # videos = "$HOME/Vidéos";
    # pictures = "$HOME/Images";
    # music = "$HOME/Mes-Donnees/03_Ressources_Externes/Musique";
    # desktop = "$HOME/Bureau";
    # templates = "$HOME/Modèles";
    # publicShare = "$HOME/Public";
  # };

}

