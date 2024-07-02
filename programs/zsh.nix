{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = { 
    	tabs = "2"; 
    };
    # histSize = 10000;
    hitsFile = "${config.xdg.dataHome}/zsh/history";
    
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
