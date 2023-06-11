{ config, pkgs, ... }:

{
  imports = [ ./config.nix ];
  # imports = [ ./config.nix ./zsh.nix];

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

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      asciiquarium
      # android-studio
      bottom
      delta
      dive # docker image size debugging
      docker
      docker-compose
      duf
      fx
      # fzf
      gh
      git
      glow
      gum
      less
      mosh
      ncdu
      neofetch
      ngrok
      ookla-speedtest
      pipenv
      python3
      raycast
      ripgrep-all # Also add the rga-fzf method
      # rga-fzf() {
      #   
      # }
      (writeShellScriptBin "rga-fzf" ''
        RG_PREFIX="rga --files-with-matches"
        local file
        file="$(
          FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
            fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
              --phony -q "$1" \
              --bind "change:reload:$RG_PREFIX {q}" \
              --preview-window="70%:wrap"
        )" &&
        echo "opening $file" &&
        xdg-open "$file"
      '')
      slack
      spotify
      tig
      tldr
      tree
      unzip
      # vlc
      vscode
      zip

    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

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

  programs.bat = {
    enable = true;
    config = { tabs = "2"; };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}
