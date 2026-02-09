{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 

    # --- PREFERER FLATPAKS POUR PURETE SYSTEME ---
    # kodi-wayland                 # plateforme multimedia - en flatpak c'est très bien
    # libreoffice-fresh            # attention, beaucoup de dépendances - prendre en flatpak
    # hunspell                     # pour libreoffice - sera inclus si on prend libreoffice en flatpak
    # hunspellDicts.fr-classique   # pour libreoffice - sera inclus si on prend libreoffice en flatpak
    # hunspellDicts.fr-reforme1990 # pour libreoffice - sera inclus si on prend libreoffice en flatpak
    # hunspellDicts.fr-moderne     # pour libreoffice - sera inclus si on prend libreoffice en flatpak
    # hunspellDicts.fr-any         # pour libreoffice - sera inclus si on prend libreoffice en flatpak
    # pika-backup                  # Pour les sauvegardes, s'intègre parfaitement. Mais les snpashots manuels sont mieux.
    # gimp                         # montage photo, retouche avancé - en flatpak c'est très bien
    # pdfarranger                  # manipulateur de fichiers pdf
    # handbrake                    # conversion de flux audio et vidéo
    # gnome-boxes                  # gestionnaire de machines virtuelles - en flatpak c'est très bien
    # zim                          # prise de notes et bobliothèque Markdown. Trouver autre chose ?
  ];
  
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.kiwix-tools               # moteur wikipedia local. Lancer avec kiwix-serve --port 8080 "/chemin/vers/fichier.zim"
    pkgs.llama-cpp-vulkan          # moteur LLM, interface web type Gemini / Chat GPT. Ne prend que 80 Mo : install de base.
    pkgs.fragments                 # Équivalent de KTorrent (Client BitTorrent GTK)
    pkgs.foliate                   # lecteur ebook
    pkgs.celluloid                 # lecteur de vidéos
    pkgs.pinta                     # logiciel de dessin
    pkgs.gnome-secrets             # gestionnaire de mots de passe compatible keepass
    

    # --- RECOMMANDES SUR GNOME ---
    pkgs.impression
    pkgs.resources
    pkgs.shortwave
    pkgs.drum-machine
    pkgs.video-trimmer

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

  ];  
  
  
  
}
