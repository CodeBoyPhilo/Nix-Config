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
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    };

    secrets = {
      "private_keys/hm" = {
        path = "/home/phil_oh/.ssh/hm_ed25519";
      };
      "private_keys/intel-mbp" = {
        path = "/Users/phil_oh/.ssh/intel-mbp_ed25519";
      };

    };
  };

}
