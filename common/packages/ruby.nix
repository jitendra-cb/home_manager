{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;[
    bundler
    rbenv
  ];
}
