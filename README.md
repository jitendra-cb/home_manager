# Nix Home Manager Setup

## Installation

1. Execute the following command (`-v` flag is optional for verbose logging). Upon completion, Home Manager would automatically activate your user environment.

```
./run.sh -v
```

2. A successful Nix installation should be able to run the following command without any error

```
nix-shell -p nix-info --run "nix-info -m"
```

3. If you do not plan on having Home Manager manage your shell configuration then you must source the following file in your shell configuration.

```
$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
```

Alternatively source the following when managing home configuration together with system configuration.

```
/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh
```

This file can be sourced directly by POSIX.2-like shells such as Bash or Z shell.

For example, if you use Bash then add the following to your ~/.profile file.

```
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
```

If instead of using channels you want to run Home Manager from a Git checkout of the repository then you can use the programs.home-manager.path option to specify the absolute path to the repository.
