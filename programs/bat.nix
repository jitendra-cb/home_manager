{ config, pkgs, lib, ... }:

{
  programs.bat = {
    enable = true;
    config = { tabs = "2"; };
  };
}
