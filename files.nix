{ config, pkgs, lib, ... }:

{
  home.file.".vimrc".source = ./dotfiles/.vimrc;
  home.file.".aliases".source = ./dotfiles/.aliases;
  home.file.".bash_logger.sh".source = ./dotfiles/.bash_logger.sh;
  home.file.".zshrc".source = ./dotfiles/.zshrc;
}
