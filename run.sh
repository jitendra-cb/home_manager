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
logVerbose "Sourced: $ABS_SCRIPT_DIR/dotfiles/.bash_logger.sh"
set -e

get_keys() {
  logInfo "[+] Setting up Keys"
  
  mkdir -p "$HOME/.ssh" && logVerbose "-> Ensured the .ssh folder is present"
  chmod 700 "$HOME/.ssh" && logVerbose '--> Set permissions for the .ssh folder'
  # TODO: GET SSH Public Key && logVerbose '--> Fetched .ssh/id_rsa.pub'
  chmod 644 "$HOME/.ssh/id_rsa.pub" && logVerbose '--> Set permissions for .ssh/id_rsa.pub'
  # TODO: GET SSH Private Key && logVerbose '--> Fetched .ssh/id_rsa'
  chmod 600 "$HOME/.ssh/id_rsa" && logVerbose '--> Set permissions for .ssh/id_rsa'
  
  mkdir -p "$HOME/.gnupg" && logVerbose "-> Ensured .gnupg folder is present"
  chmod 700 "$HOME/.gnupg" && logVerbose '--> Set permissions for the .gnupg folder'
  # TODO: GET SSH Private Key && logVerbose '--> Imported GPG keys'
  
  logSuccess "-> Keys Set Up!"
}

get_keys


# logInfo "[+] Setting up Home Manager"
# if !(nix --version); then
#   sh <(curl -L https://nixos.org/nix/install) --daemon
# else
#   logWarning "--> Nix already installed"
# fi

# if ! [ -f ~/.config/nix/nix.conf ]; then
#   mkdir -p ~/.config/nix/
#   cp $ABS_SCRIPT_DIR/dotfiles/nix.conf ~/.config/nix/nix.conf
# else
#   logWarning "--> Nix config already present"
# fi

# if !(nix-channel --list | grep home-manager &> /dev/null); then
#   nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
#   nix-channel --update
# else
#   logWarning "-> Home manage channel already exists!"
# fi

# if !(home-manager --version &> /dev/null); then
#   nix-shell '<home-manager>' -A install
# else
#   logWarning "-> Home manage already installed!"
# fi

# home-manager switch --flake $ABS_SCRIPT_DIR --show-trace -b bkp
# logSuccess "-> Home Manager Set Up!"
