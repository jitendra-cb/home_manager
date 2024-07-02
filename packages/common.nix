{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "hello" ''
        echo "Hello, ${config.home.username}!"
    '')

    
    awscli2
    bottom # Command: btm
    delta
    duf
    fx
    fzf
    less
    nixpkgs-fmt
    ncdu
    neofetch
    ripgrep-all # Also add the rga-fzf method
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
    tree
    # unzip
    # zip
  ];
}
