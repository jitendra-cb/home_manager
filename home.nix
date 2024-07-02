{ config, pkgs, lib, specialArgs, ... }:

let 
  inherit (specialArgs) username homeDirectory;
in
{
  imports = [ ./config.nix ] # nixpkgs config
    ++ [ ./dotfiles.nix ]
    ++ (lib.filesystem.listFilesRecursive ./packages)
    ++ (lib.filesystem.listFilesRecursive ./programs)  
    ++ (lib.filesystem.listFilesRecursive ./services)
    ;

  home = {
    username = username;
    homeDirectory = homeDirectory;

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.05"; # Please read the comment before changing.

    # You can also manage environment variables but you will have to manually
    # source
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    # or
    #  /etc/profiles/per-user/jitu/etc/profile.d/hm-session-vars.sh
    #
    # if you don't want to manage your shell through Home Manager.
    sessionVariables = { EDITOR = "vi"; };

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
