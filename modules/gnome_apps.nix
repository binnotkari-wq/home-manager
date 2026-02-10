{ config, pkgs, ... }:

{

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [
    kiwix-tools               # moteur wikipedia local. Lancer avec kiwix-serve --port 8080 "/chemin/vers/fichier.zim"
    llama-cpp-vulkan          # moteur LLM, interface web type Gemini / Chat GPT. Ne prend que 80 Mo : install de base.
    fragments                 # Équivalent de KTorrent (Client BitTorrent GTK)
    foliate                   # lecteur ebook
    celluloid                 # lecteur de vidéos
    pinta                     # logiciel de dessin
    gnome-secrets             # gestionnaire de mots # en flatpak c'est très biende passe compatible keepass
    resources
    shortwave
  ]; 


  # environment.systemPackages = with pkgs; [ 
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
    # impression                # en flatpak c'est très bien
    # drum-machine              # en flatpak c'est très bien
    # video-trimmer             # en flatpak c'est très bien
  # ];

}
