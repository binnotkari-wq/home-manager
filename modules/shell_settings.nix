{ pkgs, ... }:

{
  # Configuration de bash
  programs.bash = {
    enable = true;
    sessionVariables = {
    # HISTTIMEFORMAT = "%d/%m/%y %T ";  # pris en charge directement par script de déploiement user
    # EDITOR = "nano";  # pris en charge directement par script de déploiement user
    # FLATPAK_DOWNLOAD_TMPDIR = "/home/benoit/.flatpak-tmp"; # pris en charge directement par script de déploiement user
    };
    initExtra = ''
      echo -e "\e[36m=== Raccourcis =====================================\e[0m"
      echo -e "- \e[33mapps : liste des logiciels CLI / TUI astucieux"
      echo -e "- \e[33msys : commandes système spécifique Nixos"
      echo -e "- \e[33mupd : commande de mises à jour système et git"
      echo -e "\e[36m=== Installer un logiciel =====================================\e[0m"
      echo -e "- \e[33mnix-shell -p nomdulogiciel\e[0m : installer provisoirement un logiciel"
      echo -e "- \e[33mflatpak install --user flathub nomdulogiciel\e[0m" : le flatpak sera installé dans le repo flatpak userspace, depuis flathub
    '';

    # Alias
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch -I nixos-config=/home/benoit/Mes-Donnees/Git/nixos-dotfiles/$(hostname).nix";
      garbage = "nix-collect-garbage -d";
      
      
    };
  };

}
