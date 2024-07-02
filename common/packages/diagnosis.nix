{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;[
    bottom # Command: btm
    duf
    ncdu
    neofetch    
  ];
}
