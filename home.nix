{ config, pkgs, lib, ... }:

{
  imports = [ ./config.nix ] 
    ++ [ ./files.nix ]
    ++ (lib.filesystem.listFilesRecursive ./programs)
    ++ (lib.filesystem.listFilesRecursive ./services)
    ++ [ ./packages.nix ];

  home = {
    username = "jitu";
    homeDirectory = "/Users/jitu";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.05"; # Please read the comment before changing.

    packages = with pkgs; [
      (writeShellScriptBin "hello" ''
        echo "Hello, ${config.home.username}!"
      '')

      # It is sometimes useful to fine-tune packages, You can do that directly here, 
      # just don't forget the parentheses.  
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      asciiquarium
      awscli2
      bottom # Command: btm
      delta
      dive # docker image size debugging
      docker
      docker-compose
      duf
      fx
      fzf
      gh
      glow
      grpc
      gum
      helix
      iterm2
      less
      mosh
      ncdu
      neofetch
      ngrok
      ookla-speedtest
      pipenv
      python3
      raycast
      slack
      tig
      tldr
      tree
      unzip
      # vlc
      # vscode
      yarn
      zip

    ];

    # You can also manage environment variables but you will have to manually
    # source
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/jitu/etc/profile.d/hm-session-vars.sh
    #
    # if you don't want to manage your shell through Home Manager.
    sessionVariables = { EDITOR = "vi"; };

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
