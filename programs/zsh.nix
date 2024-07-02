{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = { 
    	tabs = "2"; 
    };
    # history.size = 10000;
    # history.file = "${config.xdg.dataHome}/zsh/history";
    
    plugins = [
      #{
      #    name = "name";
      #    src = pkgs.Fetch { 
      #      owner = "";
      #      repo = "";
      #      rev = "";
      #      sha256 = "";
      #    };
      #}
    ];
  };
}
