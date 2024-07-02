#!/usr/bin/env bash

_V=0
while getopts "v" OPTION
do
  case $OPTION in
    v) _V=1
    ;;
  esac
done

ABS_SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source $ABS_SCRIPT_DIR/dotfiles/.bash_logger.sh
logVerboseInfo "Sourced: $ABS_SCRIPT_DIR/dotfiles/.bash_logger.sh"
set -e

get_keys() {
  logInfo "[+] Setting up Keys"
  
  mkdir -p "$HOME/.ssh" && logVerboseInfo "--> Ensured the .ssh folder is present"
  chmod 700 "$HOME/.ssh" && logVerboseInfo '----> Set permissions for the .ssh folder'
  # TODO: GET SSH Public Key && logVerboseInfo '--> Fetched .ssh/id_rsa.pub'
  chmod 644 "$HOME/.ssh/id_rsa.pub" && logVerboseInfo '----> Set permissions for .ssh/id_rsa.pub'
  # TODO: GET SSH Private Key && logVerboseInfo '--> Fetched .ssh/id_rsa'
  chmod 600 "$HOME/.ssh/id_rsa" && logVerboseInfo '----> Set permissions for .ssh/id_rsa'
  
  mkdir -p "$HOME/.gnupg" && logVerboseInfo "--> Ensured .gnupg folder is present"
  chmod 700 "$HOME/.gnupg" && logVerboseInfo '----> Set permissions for the .gnupg folder'
  # TODO: GET SSH Private Key && logVerboseInfo '--> Imported GPG keys'
  
  logSuccess "-> Keys Set Up!"
}

get_keys

setup_home_manager() {
  logInfo "[+] Setting up Home Manager"
  
  if !(nix --version); then
    logVerboseInfo "--> Installing Nix"
    sh <(curl -L https://nixos.org/nix/install) --daemon
  else
    logVerboseWarning "--> Nix already installed!"
  fi
  
  
  if ! [ -f ~/.config/nix/nix.conf ]; then
    mkdir -p ~/.config/nix/ && logVerboseInfo "--> Ensured the .config/nix/ folder is present"
    cp $ABS_SCRIPT_DIR/dotfiles/nix.conf ~/.config/nix/nix.conf && logVerboseInfo '--> Added nix.conf'
  else
    logVerboseWarning "--> Nix config already present!"
  fi
  
  
  if !(nix-channel --list | grep home-manager &> /dev/null); then
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update && logVerboseInfo "--> Added Home manager nix-channel"
  else
    logVerboseWarning "--> Home manager nix-channel already added!"
  fi
  
  if !(home-manager --version &> /dev/null); then
    logVerboseInfo "--> Installing Home Manager"
    nix-shell '<home-manager>' -A install
  else
    logVerboseWarning "--> Home manage already installed!"
  fi
  
  logVerboseInfo "--> Switching to Home Manager"
  home-manager switch --flake $ABS_SCRIPT_DIR --show-trace -b bkp
  logSuccess "-> Home Manager Set Up!"
}

setup_home_manager
