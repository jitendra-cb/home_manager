{ config, pkgs, lib, ... }:

{
  home.file = {
    ".aliases".source = ./dotfiles/.aliases;
    ".bash_logger.sh".source = ./dotfiles/.bash_logger.sh;
    ".vimrc".source = ./dotfiles/.vimrc;
    ".zshrc".source = ./dotfiles/.zshrc;
  };
}
