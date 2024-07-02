{ config, pkgs, lib, ... }:

{
  home.file = {
    
    # Common Dotfiles  
    ".aliases".source = ./common/dotfiles/.aliases;
    ".bash_logger.sh".source = ./common/dotfiles/.bash_logger.sh;
    #".gemrc".source = ./common/dotfiles/.gemrc;
    ".vimrc".source = ./common/dotfiles/.vimrc;
    ".zshrc".source = ./common/dotfiles/.zshrc;

    # Custom Dotfiles
    ".custom_aliases".source = ./custom/dotfiles/.aliases;
    ".rectangle_config.json".source = ./custom/dotfiles/.rectangle_config.json;
    ".gemrc".source = ./common/dotfiles/.gemrc;
    ".snowsql/config".source = ./custom/dotfiles/.snowsql/config;
    "Work/Work.code-workspace".source = ./custom/dotfiles/Work.code-workspace;
    ".zshrc".source = ./custom/dotfiles/.zshrc;

  };
}
