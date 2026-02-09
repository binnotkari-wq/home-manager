{ config, pkgs, ... }:

{

  home.packages = [
    
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    
    (pkgs.writeShellScriptBin "apps" ''
      awk '/environment.systemPackages = with pkgs; \[/ {flag=1; next} /\];/ {flag=0} flag' ~/Mes-Donnees/Git/nixos-dotfiles/software-setup/programs/CLI_tools.nix
    '')

    (pkgs.writeShellScriptBin "sys" ''    
      printf "
\e[33msudo nixos-rebuild test -I nixos-config=/home/benoit/Mes-Donnees/Git/nixos-dotfiles/$(hostname).nix\e[0m : rebuild simple\n
\e[33msudo nixos-rebuild boot -I nixos-config=/home/benoit/Mes-Donnees/Git/nixos-dotfiles/$(hostname).nix\e[0m : nouvelle entrée de boot\n
\e[33msudo nixos-rebuild switch -I nixos-config=/home/benoit/Mes-Donnees/Git/nixos-dotfiles/$(hostname).nix\e[0m : rebuild système et bascule live\n
\e[33msudo nix-env --list-generations --profile /nix/var/nix/profiles/system\e[0m : lister les générations\n
\e[33msudo nix-collect-garbage -d\e[0m : gros nettoyage\n
\e[33mhome-manager switch -f /home/benoit/Mes-Donnees/Git/home-manager/home.nix\e[0m : rebuild home manager et bascule live\n"
    '')

    (pkgs.writeShellScriptBin "upd" ''     
      printf "
\e[33mflatpak update -y\e[0m : mise à jour flatpaks\n
\e[33mcd ~/Mes-Donnees/Git/nixos-dotfiles && git add . && git commit -m description_du_commit && git pull origin main && git push origin main\e[0m : synchro git\n"
    '')

  ];  
 
}
