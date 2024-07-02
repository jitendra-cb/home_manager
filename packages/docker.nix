{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    dive # docker image size debugging
    docker
    docker-compose
  ];
}
