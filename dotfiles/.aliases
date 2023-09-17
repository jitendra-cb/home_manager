{ config, pkgs, lib, ... }:

{
  home.file.".bash_aliases" = {
    text = ''
      alias aliases='bat ~/.bash_aliases --pager never && bat ~/.local/.bash_aliases --pager never 2>/dev/null'

      # for mac
      alias l='ls -lah --color=auto'
      alias ll='ls -lh --color=auto'

      alias asl='aws sso login'
      alias b='bloop'
    '';
  };
}
