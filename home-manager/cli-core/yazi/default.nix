{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    yazi
  ];

  stylix.targets.yazi.enable = true;

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    shellWrapperName = "y";

    plugins = {
      "full-border" = pkgs.yaziPlugins.full-border;
      "jump-to-char" = pkgs.yaziPlugins.jump-to-char;
    };

    initLua = ./init.lua;

    settings = {
      mgr = {
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
      mgr = {
        prepend_keymap = [
          {
            on = [
              "g"
              "D"
            ];
            run = "cd ~/Documents/";
            desc = "Go to Documents";
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
          {
            on = [ "f" ];
            run = "plugin jump-to-char";
            desc = "Jump to char";
          }
        ];
      };
    };
  };
}
