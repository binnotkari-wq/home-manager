{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # lynx        # navigateur web
    # fzf         # recherche de fichiers
    # vtm         # un desktop, prend 17 Mo
    # musikcube   # lecteur de musique, prend 24 Mo
    # mpv         # lecteur vidéo, prend 213 Mo
    # slides      # lecteur de fichiers Markdown, prend 18 Mo
    # clinfo      # Pour vérifier le support OpenCL
    # foot        # Un terminal qui ne dépend ni de KDE ni de Gnome, parfait dans une session Gamescope

    # --- SPECIALS ---
    # pandoc      # infrasctructure d'interprétation de fichiers textes et conversions
    # imagemagick # traitement et conversion d'images en batch
    # groff       # manipulation de contenu texte et conversion de formats
    # qpdf        # manipulation de fichiers pdf
  ];
}
