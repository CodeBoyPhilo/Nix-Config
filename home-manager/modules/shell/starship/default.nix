{
  pkgs,
  lib,
  ...
}:
let
  # Define color palettes
  palettes = {
    # Catppuccin Mocha palette (default)
    catppuccin = {
      blue = "#89b4fa";
			lavender = "#b4befe";
			sapphire = "#74c7ec";
      green = "#a6e3a1";
      red = "#f38ba8";
      text = "#cdd6f4";
      subtext = "#a6adc8";
      overlay = "#6c7086";
      purple = "#cba6f7";
      yellow = "#f9e2af";
      orange = "#fab387";
    };

    # Tokyo Night palette
    tokyonight = {
      blue = "#7aa2f7";
      green = "#9ece6a";
      red = "#f7768e";
      text = "#c0caf5";
      subtext = "#a9b1d6";
      overlay = "#565f89";
      purple = "#bb9af7";
      yellow = "#e0af68";
      orange = "#ff9e64";
      teal = "#73daca";
    };
  };

  # SWITCH THEMES HERE - Comment out one and uncomment the other
  colors = palettes.catppuccin; # Catppuccin Mocha theme
  # colors = palettes.tokyonight; # Tokyo Night theme
in
{
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
		enableBashIntegration = true;
    settings = {
      add_newline = true;
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
        "$os"
        "$hostname"
        "$nix_shell"
        "$cmd_duration"
        "$fill"
        "$conda"
        "$python"
        # "$memory_usage"
        "$line_break"
        "$character"
      ];

      directory = {
        style = "bold fg:${colors.overlay}";
        repo_root_style = "bold fg:${colors.blue}";
        format = "[$path ]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
        truncate_to_repo = false;
        repo_root_format = "[󰏗 $repo_root]( $repo_root_style)[$path ]($repo_root_style)";
      };

      git_branch = {
        style = "bold fg:${colors.overlay}";
        symbol = " ";
        format = "[$symbol$branch ]($style)";
      };

      git_status = {
        style = "bold fg:${colors.orange}";
        modified = "M";
        deleted = "D";
        format = "([$all_status$ahead_behind]($style) )";
      };

      os = {
        format = "[($name) ]($style)";
        style = "bold ${colors.green}";
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
        style = "bold italic ${colors.yellow}";
        aliases = {
          "PhiloWu-M1MacBookPro" = "m1-mbp";
        };
        disabled = false;
      };

      cmd_duration = {
        min_time = 500;
        style = "fg:${colors.overlay}";
        format = "[$duration]($style)";
        show_notifications = false;
      };

      fill.symbol = " ";

      conda = {
        style = "${colors.blue}";
        symbol = " ";
        format = "[$environment $symbol]($style)";
      };

      python = {
        style = "${colors.blue}";
        symbol = " ";
        version_format = "$major.$minor";
        format = "[($virtualenv )$symbol$pyenv_prefix($version )]($style)";
        pyenv_version_name = false;
        pyenv_prefix = "";
        detect_files = [ ];
        detect_extensions = [ ];
      };

      nix_shell = {
        disabled = false;
        impure_msg = "[ ](bold ${colors.lavender})";
        pure_msg = "[ ](bold green)";
        unknown_msg = "[ ](bold yellow)";
        format = "$state";
      };

      memory_usage = {
        disabled = false;
        threshold = -1;
        style = "bold ${colors.green}";
        format = "$symbol[$ram_pct]($style) ";
      };

      character = {
        success_symbol = "[❯](bold ${colors.green})";
        error_symbol = "[❯](bold ${colors.red})";
      };

      line_break.disabled = false;
    };
  };
}
