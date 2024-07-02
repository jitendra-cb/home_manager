{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;[
    pipenv
    python3
  ];
}
