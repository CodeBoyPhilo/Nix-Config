# Philo's Nix-Config

This repo contains my personal nix-config for nix-darwin, home-manager, and NixOS.
It is intended for cross-platform quick deployment of my dev environment.

> My config is based on and is heavily influenced by [whimpy's config](https://github.com/wimpysworld/nix-config).

# My rice 🍚
[![Watch the video](assets/my-rice.png)](assets/my-rice.mp4)

# Example Usage
- Apply home-manager config
```bash
home-manager switch --flake .#username@hostname
```

- Apply nix-darwin config
    - for the first time, run:
    ```bash
    nix build .#darwinConfigurations.hostname.system
    ./result/sw/bin/darwin-rebuild switch --flake .#hostname
    ```
    - after that, you can use:
    ```bash
    darwin-rebuild switch --flake .#hostname
    ```

