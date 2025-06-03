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
    defaultSopsFile = ../../../../secrets.yaml;
    validateSopsFiles = false;

    age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    };

    secrets = {
      "private_keys/lanix" = {
        path = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };
      "private_keys/m1-mbp" = {
        path = "${config.home.homeDirectory}/.ssh/m1-mbp_ed25519";
      };

    };
  };

}
