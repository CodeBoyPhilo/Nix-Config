{ username, ... }:
{
  homebrew = {
    casks = [ "chatgpt" ];
  };


  services.openssh = {
    enable = true;
  };

  users.users.${username}.openssh.authorizedKeys.keys = [
    "../../keys/lanix/id_ed25519.pub"
  ];
}
