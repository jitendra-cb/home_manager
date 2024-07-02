{ config, pkgs, lib, ... }:

{
  home.file = {
    
    # Common Dotfiles  
    ".aliases".source = ./dotfiles/.aliases;
    ".bash_logger.sh".source = ./dotfiles/.bash_logger.sh;
    ".gemrc".source = ./dotfiles/.gemrc;
    ".vimrc".source = ./dotfiles/.vimrc;
    ".zshrc".source = ./dotfiles/.zshrc;

    # Custom Dotfiles
    ".custom_aliases".source = ./custom/dotfiles/.aliases;
    
  };
}
