{
  inputs,
  pkgs,
  config,
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
    defaultSopsFile = ../../../../secrets.yaml;
    validateSopsFiles = false;

    age = {
      keyFile = "/home/phil_oh/.config/sops/age/keys.txt";
    };

    secrets = {
      "private_keys/lanix" = {
        path = "/home/phil_oh/.ssh/id_ed25519";
      };
      "private_keys/m1-mbp" = {
        path = "/Users/phil_oh/.ssh/id_ed25519";
      };

    };
  };

}
