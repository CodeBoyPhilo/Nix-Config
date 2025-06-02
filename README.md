# Philo's Nix-Config

This repo contains my personal nix-config for nix-darwin, home-manager, and NixOS.
It is intended for cross-platform quick deployment of my dev environment.
Currently, it supports the deployment on the following:

| Hostname| Archetecture | Operating System | Notes |
|------------|-------------------|------------------|-------|
| m1-mbp     | aarch64-darwin | macOS Sequoia    |       |
| intel-mbp  | x86_64-darwin | macOS Sequoia    |       |
| hm         | aarch64-linux| Ubuntu (latest)  | Created using OrbStack |
| kubulabu   | x86_64-linux | (K)Ubuntu 24.04 |           |
| lanix      | x86_64-linux | NixOS 25.05 |         |

My config is based on and is heavily influenced by [whimpy's config](https://github.com/wimpysworld/nix-config).

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

