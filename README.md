# Nix Home Manager Setup

## Installation

1. Make sure you have a working Nix installation from [the official site](https://nixos.org/download.html#download-nix). Once installed, ensure that your user is able to build and install Nix packages without having to switch to the root user. For example, you should be able to successfully run a command like 
```
nix-instantiate '<nixpkgs>' -A hello
```

---
2. With nix installed and configured, execute the `./run.sh` bash script. Upon completion, Home Manager should be available and activate your user environment.

---
3. If you do not plan on having Home Manager manage your shell configuration then you must source the
```
$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
```
file in your shell configuration. Alternatively source
```
/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh
```
when managing home configuration together with system configuration.

This file can be sourced directly by POSIX.2-like shells such as Bash or Z shell. Fish users can use utilities such as foreign-env or babelfish.

For example, if you use Bash then add
```
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
```
to your ~/.profile file.

If instead of using channels you want to run Home Manager from a Git checkout of the repository then you can use the programs.home-manager.path option to specify the absolute path to the repository.
