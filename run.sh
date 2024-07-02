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

####
get_doc() {
  logInfo "-> Fetching $1"
  op get document "$1" > "$2"
  set_perm "$2" "$3"
}

get_keys() {
  mkdir -p "$HOME/.ssh" && logInfo "-> Ensuring .ssh folder is present"
  chmod 700 "$HOME/.ssh" && logSuccess '--> Setting permissions for the .ssh folder'
  get_doc 'SSH Public Key' "$HOME/.ssh/id_rsa.pub" 644 && logSuccess '--> Setting permissions for the .ssh folder'
  get_doc 'SSH Private Key' "$HOME/.ssh/id_rsa" 600 && logSuccess '--> Setting permissions for the .ssh folder'
  
  # mkdir -p "$HOME/.gnupg" && logInfo "-> Ensuring .gnupg folder is present"
  # chmod 700 "$HOME/.gnupg" && logSuccess '--> Setting permissions for the .gnupg folder'
  # op get document 'GPG Private Key' | gpg --import -q && logSuccess '--> logSuccessfully imported GPG key'
}

# get_keys

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
