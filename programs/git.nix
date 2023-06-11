{ config, pkgs, lib, ... }:

{
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Jitendra Sachwani";
    userEmail = "sachwani.jitendra@gmail.com";
  };
}
