{ config, pkgs, lib, ... }:

{
  home.file = {

    ".aliases".source = ./dotfiles/.aliases;
    ".bash_logger.sh".source = ./dotfiles/.bash_logger.sh;
    ".gemrc".source = ./dotfiles/.gemrc;
    ".vimrc".source = ./dotfiles/.vimrc;
    ".zshrc".source = ./dotfiles/.zshrc;

    ".rectangle_config.json".source = ./dotfiles/.rectangle_config.json;
    "Work/Work.code-workspace".source = ./dotfiles/Work.code-workspace;
    ".snowsql/config".source = ./dotfiles/.snowsql/config;
  };
}
