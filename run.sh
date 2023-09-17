#!/usr/bin/env bash


ABS_SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source $ABS_SCRIPT_DIR/dotfiles/.bash_logger.sh
set -e

####
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

# get_creds

info "[+] Setting up Home Manager"
if !(nix --version); then 
  sh <(curl -L https://nixos.org/nix/install) --daemon
else
  warn "--> Nix already installed"
fi

if ! [ -f ~/.config/nix/nix.conf ]; then
  mkdir -p ~/.config/nix/
  cp $ABS_SCRIPT_DIR/dotfiles/nix.conf ~/.config/nix/nix.conf
else
  warn "--> Nix config already present" 
fi

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

home-manager switch --flake $ABS_SCRIPT_DIR --show-trace -b bkp
success "-> Home Manager Set Up!"
