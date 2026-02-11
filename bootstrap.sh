#!/usr/bin/env bash


# --- INSTALLATION ET DEPLOIEMENT DE HOME MANAGER (ET DU NIX STORE SI PAS PRESENT)

set -e

# --- CONFIGURATION ---
MY_GH_REPO="https://github.com/ton-pseudo/mon-repo-dotfiles.git"

echo "🔍 Vérification de l'environnement..."

# 1. GESTION DU RÉPERTOIRE /nix : s'il est absent, systemd va créer un lien symbolique à chaque démarrage. Ainsi en cas de distro immutable, le lien sera bien présent. Et s'il est présent, comme c'est le cas dès le début avec Nixos, l'étape est sautée).
if [ ! -d "/nix" ]; then
    echo "❄️ Préparation de l'ancrage /nix..."
    sudo mkdir -p /var/nix
    echo "L /nix - - - - /var/nix" | sudo tee /etc/tmpfiles.d/nix.conf
    sudo systemd-tmpfiles --create /etc/tmpfiles.d/nix.conf
fi

# 2. INSTALLATION DE NIX (en testant s'il est peut-être déjà installé...ce qui sera le cas sur NixOS)
if ! command -v nix &> /dev/null; then
    echo "📦 Installation de Nix..."
    curl -L https://nixos.org/nix/install | sh -s -- --daemon
    . /etc/profile.d/nix.sh || . ~/.nix-profile/etc/profile.d/nix.sh
fi

# 3. CONFIGURATION DES CHANNELS
echo "📡 Configuration des canaux Nix (Branche Stable 25.11)..."
nix-channel --add https://nixos.org/channels/nixos-25.11 nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
nix-channel --update


# 4. DÉPLOIEMENT (((REVOIR CETTE PARTIE IL FAUT PEUT ETRE DEJA FAIRE UN CLONAGE PROPRE DES REPOS ET NE PAS OUBLIER HARDWARE CONFIGURATION.NIX)
echo "🏠 Clonage et activation de l'environnement..."
# On télécharge git temporairement pour cloner
nix-shell -p git --run "
    if [ ! -d \"\$HOME/.config/nixpkgs\" ]; then
        git clone $MY_GH_REPO \$HOME/.config/nixpkgs
    fi
"

# Installation de Home Manager si absent, puis switch
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install
home-manager switch -f /home/benoit/Mes-Donnees/Git/home-manager/home.nix

echo "🎉 Terminé ! Ton environnement est prêt."
