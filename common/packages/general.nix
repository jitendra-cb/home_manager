{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;[
    (writeShellScriptBin "hello" ''
        echo "Hello, ${config.home.username}!"
    '')

    asciiquarium
    awscli2
    delta
    fx
    fzf
    less
    nixpkgs-fmt
    ripgrep-all
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
    tldr
    tree
    # unzip
    # vscode
    # vlc
    # zip

    # TODO: try
    # glow
    # gum
    # helix

    # TODO: categorise
    # iterm2
    # mosh
    # ngrok
    # slack
  ];
}
