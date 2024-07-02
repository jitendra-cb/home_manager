{ config, pkgs, lib, ... }:

{
  services.gpg-agent = {
    enable = pkgs.hostPlatform.isLinux;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}

