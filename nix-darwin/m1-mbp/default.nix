{ username, ... }:
{
  homebrew = {
    casks = [ "chatgpt" ];
  };

  # services.openssh = {
  #   enable = true;
  #   extraConfig = ''
  #     Include /etc/ssh/sshd_config.d/*
  #     Port 22
  #     HostKey /etc/ssh/ssh_host_rsa_key
  #     HostKey /etc/ssh/ssh_host_ed25519_key
  #     AuthorizedKeysFile .ssh/authorized_keys
  #     PasswordAuthentification no
  #     Subsystem	sftp	/usr/libexec/sftp-server
  #   '';
  # };
  #
  # users.users.${username}.openssh.authorizedKeys.keys = [
  #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEC1ISqrOaIEXWqNAl79LeWkhbzLl1W0LksLB0ioG9Ik lanix"
  # ];
}
