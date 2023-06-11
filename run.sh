#!/usr/bin/env bash

set -e

BOLD_BLUE='\033[0;1;34m'
BOLD_GREEN='\033[0;1;32m'
BOLD_RED='\033[0;1;31m'
BOLD_YELLOW='\033[0;1;33m'

RESET='\033[0m'
DEST="$HOME/.config/nixpkgs"

err() { echo -e "${BOLD_RED}$1${RESET}" ; }

warn() { echo -e "${BOLD_YELLOW}$1${RESET}" ; }

info() { echo -e "${BOLD_BLUE}$1${RESET}" ; }

success() { echo -e "${BOLD_GREEN}$1${RESET}" ; }

# -------------------------------------------------------------------------------
#  Script Execution 
# -------------------------------------------------------------------------------

update_submodules() {
    info "[+] Updating submodules"
    git submodule update --init --recursive --remote
    success "-> Done updating submodules!"
}

link_config() {
    info "[+] Linking config"

    if [ -e "$DEST" ]; then
        if [ -L "$DEST" ]; then
            warn "Configuration already linked: nothing to be done."
        else
            err "Existing configuration found. Please move it away and run this script again."
        fi

        return
    fi

    ln -svr . "$DEST"
    success "-> Configuration successfully linked!"
}

set_perm() {
    chmod "$2" "$1" && success "--> Set permission of $1 to $2"
}

get_doc() {
    info "-> Fetching $1"
    op get document "$1" > "$2"
    set_perm "$2" "$3"
}

get_ssh() {
    mkdir -p "$HOME/.ssh" && info "-> Ensuring .ssh folder is present"
    chmod 700 "$HOME/.ssh" && success '--> Setting permissions for the .ssh folder'

    get_doc 'SSH Public Key' "$HOME/.ssh/id_rsa.pub" 644
    get_doc 'SSH Private Key' "$HOME/.ssh/id_rsa" 600

    mkdir -p "$HOME/.gnupg" && info "-> Ensuring .gnupg folder is present"
    chmod 700 "$HOME/.gnupg" && success '--> Setting permissions for the .gnupg folder'
}

get_gpg() {
    mkdir -p "$HOME/.gnupg" && info "-> Ensuring .gnupg folder is present"
    chmod 700 "$HOME/.gnupg" && success '--> Setting permissions for the .gnupg folder'

    info "-> Importing private GPG key"
    op get document 'GPG Private Key' | gpg --import -q && success '--> Successfully imported GPG key'
}

get_creds() {
    local domain
    local email
    local secret

    read -p 'Enter your 1password domain: ' domain
    read -p 'Enter your 1password email: ' email
    read -p 'Enter your 1password secret key: ' secret

    info "[+] Fetching secrets from 1password"

    eval "$(op signin ${domain} ${email} ${secret})"

    get_ssh
    get_gpg
}

# -------------------------------------------------------------------------------
#  Script Execution 
# -------------------------------------------------------------------------------

# link_config
# get_creds
# update_submodules

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

info "[+] Setting up Home Manager"
if !(nix-channel --list | grep home-manager &> /dev/null); then 
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
else 
  warn "-> Home manage channel already exists!"
fi

if !(home-manager --version &> /dev/null); then
  nix-shell '<home-manager>' -A install
else
  warn "-> Home manage already installed!"
fi

home-manager switch --flake $SCRIPT_PATH --show-trace
success "-> Home Manager Set Up!"