{ config, pkgs, ... }:

{

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    
    (pkgs.writeShellScriptBin "sys" ''
      awk '/environment.systemPackages = with pkgs; \[/ {flag=1; next} /\];/ {flag=0} flag' ~/Mes-Donnees/Git/nixos-dotfiles/software-setup/programs/CLI_tools.nix
    '')

  ];  
 
}
