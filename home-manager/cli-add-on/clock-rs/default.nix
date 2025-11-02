{config, pkgs, ...}:
let
  stylix-colors = config.lib.stylix.colors.withHashtag;
in
{
programs.clock-rs = {
  enable = true;

  settings = {
    general = {
      color = "${stylix-colors.base06}";
      interval = 200;
      blink = false;
      bold = false;
    };

    position = {
      horizontal = "center";
      vertical = "center";
    };

    date = {
      fmt = "%a %d %b %y";
      use_12h = false;
      utc = false;
      hide_seconds = false;
    };
  };
};
  programs.zsh = {
    shellAliases = {
      clock = "clock-rs";
    };
  };
  programs.fish= {
    shellAliases = {
      clock = "clock-rs";
    };
  };
}
