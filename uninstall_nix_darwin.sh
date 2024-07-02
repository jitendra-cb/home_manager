#!/usr/bin/env bash

if [ -f "/etc/zshrc.backup-before-nix" ]; then
  # sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
  echo "Reverted /etc/zshrc!"
fi

sed -e '/^# Nix/,/# End Nix/d' /etc/zshrc # > /etc/zshrc
echo "Removed Nix from /etc/zsrch!"

# TODO: EDIT fstab to remove nix store mount points
#

sed -e '/nix/d' /etc/synthetic.conf # > /etc/synthetic.conf
echo "Removed Nix from /etc/synthetic.conf!"

if [ -f "/Library/LaunchDaemons/org.nixos.nix-daemon.plist" ]; then
  # sudo launchctl unload /Library/LaunchDaemon/org.nixos.nix-daemon.plist
  # sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
  echo "Removed Nix from /Library/LaunchDaemons/org.nixos.nix-daemon.plist!"
fi

if [ -f "/Library/LaunchDaemons/org.nixos.activate-system.plist" ]; then
  # sudo launchctl unload /Library/LaunchDaemons/org.nixos.activate-system.plist
  # sudo rm /Library/LaunchDaemons/org.nixos.activate-system.plist
  echo "Removed Nix from /Library/LaunchDaemons/org.nixos.nix-daemon.plist!"
fi

# sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels
echo "Removed all the Nix files from the system"

# sudo dscl . delete /Groups/nixbld
echo "Removed the nixbld Group"

# for i in $(seq 1 32); do sudo dscl . -delete /Users/_nixbld$i; done
echo "Removed all the _nixbuildN users"

# sudo diskutil apfs deleteVolume /nix
# sudo rm -rf /nix/
echo "Removed the nix store volume"


# rm /Users/jitu/.local/state/nix/profiles/home-manager*
# rm /Users/jitu/.local/state/home-manager/gcroots/current-home
echo "Removed home manager generations"

echo "Reboot the system for the changes to take effect"
# sudo reboot