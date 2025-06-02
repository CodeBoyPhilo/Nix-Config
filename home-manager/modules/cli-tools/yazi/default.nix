{
  config,
  pkgs,
  ...
}:
let
  tokyo-night-yazi = pkgs.fetchFromGitHub {
    "owner" = "bennyoe";
    "repo" = "tokyo-night.yazi";
    "rev" = "695dac6bcc605ba4b0bf1b1f56169eaa7cc4bb40";
    "hash" = "sha256-+wZzxLPCttJ2WoDdI89sQ+CcZSFIA44HshxMoh4rJIs=";
  };
in
{
  home.packages = with pkgs; [
    yazi
  ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    # Use the external theme file
    theme = {
      flavor = {
        dark = "tokyonight";
      };
    };

    flavors = {
      tokyonight = "${tokyo-night-yazi}";
    };

    settings = {
      manager = {
        ratio = [
          2
          4
          3
        ];
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = false;
        linemode = "mtime";
        show_hidden = false;
        show_symlink = true;
      };
      preview = {
        wrap = "no";
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        image_delay = 30;
        image_filter = "triangle";
        image_quality = 75;
        sixel_fraction = 15;
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };
      tasks = {
        micro_workers = 10;
        macro_workers = 10;
        bizarre_retry = 3;
        image_alloc = 536870912;
        image_bound = [
          0
          0
        ];
        suppress_preload = false;
      };
      edit = [
        {
          run = "${pkgs.neovim}/bin/nvim \"$@\"";
          block = true;
        }
      ];
    };
    keymap = {
      manager = {
        prepend_keymap = [
          {
            on = [
              "g"
              "D"
            ];
            run = "cd ~/Desktop/";
            desc = "Go to Desktop";
          }
          {
            on = [
              "g"
              "N"
            ];
            run = "cd ~/nix-config/";
            desc = "Go to Nix-Config dir";
          }
          {
            on = [
              "g"
              "n"
            ];
            run = "cd ~/.config/nixvim/";
            desc = "Go to Nixvim Config dir";
          }
          {
            on = [
              "g"
              "P"
            ];
            run = "cd ~/Projects/";
            desc = "Go to Projects";
          }
        ];
      };
    };
  };
}
