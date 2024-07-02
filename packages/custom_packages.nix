{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;[
    # Add packages specific to current branch here
    # sonarr
    # radarr
    # lidarr
    # jackett
    # transmission
  ];
}
