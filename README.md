# Philo's Nix-Config

<p align="center">
  <img src="assets/my-rice.png" width="800" height="auto">
</p>

This repo contains my personal nix-config for nix-darwin, home-manager, and NixOS.
It is intended for cross-platform quick deployment of my dev environment.

> My config is based on and is heavily influenced by [whimpy's config](https://github.com/wimpysworld/nix-config).

# A glance at my rice 🍚
[assets/my-rice.png](https://github.com/user-attachments/assets/d26cc2cb-75c0-4d6c-9f81-36d3e416bc20)

- <a href="home-manager/modules/wallpapers/wallpapers/A.png">Wallpaper</a>
- [Hyprland](home-manager/modules/platforms/nixos/hyprland/default.nix)
- [Waybar](home-manager/modules/platforms/nixos/hyprland/waybar/minimal/default.nix)

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




