{ username, ... }:
{
  services.openssh = {
    enable = true;
  };

  users.users.${username}.openssh.authorizedKeys.keys = [
    "./keys/hm_ed25519.pub"
		"./keys/intel-mbp_ed25519.pub"
  ];
}
