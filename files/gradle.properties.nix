{ config, pkgs, lib, ... }:

{
  home.file.".gradle/gradle.properties" = {
    text = ''
      org.gradle.console=verbose
      org.gradle.daemon.idletimeout=3600000
    '';
  };
}
