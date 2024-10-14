# Hetzner NixOS Setup

Use NixOS any to setup nixOS on Hetzner Cloud VPS.

## Steps:

1. Update your public SSH keys in `configuration.nix`.
2. Update the disk ID in `disk-config.nix`.
3. Update the machine, user and network name.

## Install:

```bash
nix run github:nix-community/nixos-anywhere -- --flake .#devbox root@1.2.3.4

```

For more information, read this [blog post.](https://joinemm.dev/blog/nixos-hetzner-cloud)
