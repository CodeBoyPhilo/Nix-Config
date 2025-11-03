{
  config,
  pkgs,
  lib,
  ...
}:
let
  stylix-colors = config.lib.stylix.colors.withHashtag;
in
{
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
		enableFishIntegration = true;
		enableTransience = true;
    settings = {
      add_newline = true;
      format = lib.concatStrings [
        "$directory"
        "$\{custom.git_branch\}"
        "$\{custom.jj_bookmark\}"
        "$git_status"
        "$os"
        "$hostname"
        "$nix_shell"
        "$\{custom.activated_python\}"
        "$\{custom.sudo_session\}"
        "$fill"
        "$cmd_duration"
        "$line_break"
        "$conda"
        "$python"
        "$character"
      ];

      directory = {
        style = "bold fg:${stylix-colors.base04}";
        repo_root_style = "bold fg:${stylix-colors.base08}";
        format = "[$path ]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
        truncate_to_repo = false;
        repo_root_format = "[󰏗 $repo_root]( $repo_root_style)[$path ]($repo_root_style)";
      };

      git_branch = {
        style = "bold fg:${stylix-colors.base04}";
        symbol = " ";
        format = "[$symbol$branch]($style)";
        disabled = true;
      };

      git_status = {
        style = "bold fg:${stylix-colors.base0A}";
        modified = "M";
        deleted = "D";
        format = "([$all_status$ahead_behind]($style) )";
      };

      os = {
        format = "[($name) ]($style)";
        style = "bold ${stylix-colors.base09}";
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
        style = "bold italic ${stylix-colors.base07}";
        aliases = {
          "PhiloWu-M1MacBookPro" = "m1-mbp";
        };
        disabled = false;
      };

      cmd_duration = {
        min_time = 500;
        style = "fg:${stylix-colors.base02}";
        format = " [ $duration]($style)";
        show_notifications = false;
      };

      fill.symbol = " ";

      conda = {
        style = "${stylix-colors.base07}";
        symbol = "";
        format = "[$environment ]($style)";
      };

      python = {
        style = "${stylix-colors.base06}";
        symbol = "";
        version_format = "$major.$minor";
        format = "[($virtualenv) ]($style)";
        pyenv_version_name = false;
        pyenv_prefix = "";
        detect_files = [ ];
        detect_extensions = [ ];
      };

      nix_shell = {
        disabled = false;
        impure_msg = "[ ](bold ${stylix-colors.base06})";
        pure_msg = "[ ](bold ${stylix-colors.base0B})";
        unknown_msg = "[ ](bold ${stylix-colors.base0C})";
        format = "$state";
      };

      custom = {
        activated_python = {
          style = "${stylix-colors.base06}";
          when = "command -v python >/dev/null 2>&1";
          symbol = " ";
          format = "[$symbol]($style)";
        };
        sudo_session = {
          style = "${stylix-colors.base06}";
          when = ''test "$EUID" -eq 0'';
          # command = "echo 󰌾 ";
          symbol = "󰌾 ";
          format = "[$symbol]($style)";
        };
        git_branch = {
          when = true;
          command = "jj root >/dev/null 2>&1 || starship module git_branch | sed 's/\\x1b\\[[0-9;]*m//g'";
          description = "Only show git_branch if we're not in a jj repo";
          style = "bold fg:${stylix-colors.base04}";
        };
        jj_bookmark = {
          ignore_timeout = true;
          description = "The current jj change id and bookmark";
          when = "jj root";
          command = ''
            jj log --revisions 'heads(::@ & bookmarks())' --no-graph --ignore-working-copy --color never --limit 1 --template '
              separate(" ",
                bookmarks,
              )
            ' | sed 's/\\x1b\\[[0-9;]*m//g'
            				'';
          symbol = " ";
          style = "bold fg:${stylix-colors.base04}";
          format = "[$symbol$output ]($style)";
        };

      };

      character = {
        # success_symbol = "[❯](bold ${stylix-colors.base06})";
        success_symbol = "[󰊠 ](bold ${stylix-colors.base06})";
        # error_symbol = "[❯](bold ${stylix-colors.base0F})";
        error_symbol = "[󰧵 ](bold ${stylix-colors.base0E})";
				vimcmd_symbol = "[󱙝 ](bold ${stylix-colors.base06})";
				vimcmd_replace_symbol = "[󱙝 ](bold ${stylix-colors.base0F})";
				vimcmd_replace_one_symbol = "[󱙝 ](bold ${stylix-colors.base0F})";
				vimcmd_visual_symbol = "[󱙝 ](bold ${stylix-colors.base0C})";
      };

      line_break.disabled = false;
    };
  };
}
