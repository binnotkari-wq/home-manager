{ pkgs, ... }:

{
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    # protonup-qt
    # warzone2100                # :)
    # heroic                     # Flatpak est souvent recommandé par la communauté NixOS. Comme Heroic gère des jeux provenant de magasins qui ne supportent pas Linux nativement (Epic/GOG), l'isolation Flatpak fournit un environnement plus "standard" que les jeux Windows apprécient.:
  ];
  
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.kiwix-tools                                 # moteur wikipedia local. Lancer avec kiwix-serve --port 8080 "/chemin/vers/fichier.zim"
    pkgs.llama-cpp-vulkan                            # moteur LLM, interface web type Gemini / Chat GPT. Ne prend que 80 Mo : install de base.
    pkgs.fragments                                   # Équivalent de KTorrent (Client BitTorrent GTK)
    pkgs.foliate                                     # lecteur ebook
    pkgs.celluloid                                   # lecteur de vidéos
    pkgs.pinta                                       # logiciel de dessin
    pkgs.gnome-secrets                               # gestionnaire de mots de passe compatible keepass
    

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

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')
  ];  
}
