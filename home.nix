{ config, pkgs, ... }:

{
  # installer home-amanger de façon indépendante avec :
  # 1. : nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager # On ajoute le dépôt Home Manager 
  # 2. : nix-channel --update # On met à jour les dépôts 
  # 3. : nix-shell '<home-manager>' -A install
  
  # 4. : au premier "home-manager switch", il s'auto installera indépendamment
  programs.home-manager.enable = true;
  
  
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "benoit";
  home.homeDirectory = "/home/benoit";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  # 4. Configuration de logiciels (Le rôle "Architecte")
  # Ici, Nix génère le fichier .gitconfig à votre place.
  # programs.git = {
    # enable = true;
    # userName = "Votre Nom";
    # userEmail = "votre@email.com";
    # aliases = {
      # st = "status";
      # ad = "add";
    # };
  # };



  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/benoit/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "nano";
  };
}
