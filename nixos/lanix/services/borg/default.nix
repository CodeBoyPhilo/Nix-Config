{ config, pkgs, ... }:
let
  common-excludes = [
    # Largest cache dirs
    ".cache"
    "*/cache2" # firefox
		".mozilla"
    "*/Cache"
    "__pycache__"
    ".local"
		".xwechat"
    # Work related dirs
    "*/venv"
    "*/.venv"
    "*/.conda"
  ];
in
{
  services.borgbackup = {
    repos = {
      local-home-phil_oh = {
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJPWr1+fN2MQcg/Vi8EZH7xmQsoxXJUzuid40Kvm1gyH phil_oh@lanix"
        ];
        path = "/mnt/Backup/lanix/backup/home-phil_oh";
      };
    };
    jobs = {
      localHomeDir = {
        doInit = false;
        paths = "/home/phil_oh";
        exclude = map (x: "/home/phil_oh" + "/" + x) (
          common-excludes
          ++ [
            "Downloads"
          ]
        );
        repo = "borg@lanix:.";
        encryption.mode = "none";
        environment = {
          BORG_RSH = "ssh -i /home/phil_oh/.ssh/id_ed25519_borg";
        };
        compression = "auto,lzma";
        startAt = "daily";
      };

      remoteHomeDir = {
        paths = "/home/phil_oh";
        exclude = map (x: "/home/phil_oh" + "/" + x) (
          common-excludes
          ++ [
            "Downloads"
          ]
        );
				repo = "ssh://gn6gek4i@gn6gek4i.repo.borgbase.com/./repo";
        encryption.mode = "none";
        environment.BORG_RSH = "ssh -o StrictHostKeyChecking=accept-new -i /home/phil_oh/.ssh/id_ed25519_borg";
        environment.BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK = "yes";
        compression = "auto,lzma";
        startAt = "daily";
      };

    };
  };

  environment.systemPackages = with pkgs; [ vorta ];
}
