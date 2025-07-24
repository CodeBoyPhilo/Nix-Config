{
  inputs,
  pkgs,
  config,
  hostname,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  home.packages = with pkgs; [
    sops
  ];

  sops = {
    defaultSopsFile = ../../../../../secrets.yaml;
    validateSopsFiles = false;

    age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    };

    secrets = {
      "private_keys/lanix" = {
        path = "${config.home.homeDirectory}/.ssh/lanix_ed25519";
      };
      "private_keys/m1-mbp" = {
        path = "${config.home.homeDirectory}/.ssh/m1-mbp_ed25519";
      };
      "private_keys/lanix-borg" = {
        path = "${config.home.homeDirectory}/.ssh/lanix-borg_ed25519";
      };
      "api_keys/avante_anthropic" = {
        path = "${config.home.homeDirectory}/.config/api/avante_anthropic.txt";
      };
      "api_keys/avante_openai" = {
        path = "${config.home.homeDirectory}/.config/api/avante_openai.txt";
      };
      "api_keys/avante_gemini" = {
        path = "${config.home.homeDirectory}/.config/api/avante_gemini.txt";
      };
    };

  };
}
