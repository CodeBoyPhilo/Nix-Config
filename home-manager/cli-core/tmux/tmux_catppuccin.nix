{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    tmux
  ];

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      vim-tmux-navigator
      resurrect
      continuum
    ];
    extraConfig = ''
      set -sag terminal-features ",*:RGB"
      set -sag terminal-features ",*:usstyle"
      set-option -ga terminal-overrides ",*-256color*:TC"

      set -g prefix C-a
      unbind C-b
      bind-key C-a send-prefix

      unbind %
      bind | split-window -h

      unbind '"'
      bind - split-window -v

      unbind r
      bind r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      bind -r m resize-pane -Z

      set -g mouse on

      set-window-option -g mode-keys vi

      bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
      bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

      unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode after dragging with mouse

      # ----- tpipeline configuration -----
      # Set the status bar at the bottom
      set -g status-position bottom

      # Set transparent background for tpipeline
      set -g status-bg default
      set -g status-style bg=default

      # Provide enough space for vim statusline
      set -g status-left-length 90
      set -g status-right-length 90

      # Configure the tmux status line for tpipeline compatibility
      set -g status-justify absolute-centre

      set -g status-left ""
      set -g status-right ""

      # Configure Catppuccin
      set -g @catppuccin_flavor 'mocha'
      set -g @catppuccin_status_background "none"
      set -g @catppuccin_window_status_style "none"
      set -g @catppuccin_pane_status_enabled "off"
      set -g @catppuccin_pane_border_status "off"

      # window look and feel
      set -wg automatic-rename on
      set -g automatic-rename-format "Window"

      # Window status format for non-current windows (dimmed text)
      set -g window-status-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-style "bg=default,fg=#{@thm_overlay_0}"
      set -g window-status-last-style "bg=default,fg=#{@thm_overlay_1}"
      set -g window-status-activity-style "bg=default,fg=#{@thm_red},dim"
      set -g window-status-bell-style "bg=default,fg=#{@thm_red},dim"
      set -gF window-status-separator "#[bg=default,fg=#{@thm_overlay_0}]│"

      # Window status format for current window - bright, distinct color
      set -g window-status-current-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-current-style "bg=default,fg=#{@thm_peach},bold"

      # pane border look and feel
      setw -g pane-border-status off
      setw -g pane-border-format ""
      setw -g pane-active-border-style "bg=#{@thm_bg},fg=#{@thm_overlay_0}"
      setw -g pane-border-style "bg=#{@thm_bg},fg=#{@thm_surface_0}"
      setw -g pane-border-lines single

      set -g @resurrect-capture-pane-contents 'on' # allow tmux-ressurect to capture pane contents
      set -g @continuum-restore 'on' # enable tmux-continuum functionality

      # for image display
      set-option -g allow-passthrough on
      set -g visual-activity off
    '';
  };

  programs.zsh = {
    shellAliases = {
      ta = "tmux attach-session -t";
      ts = "tmux new-session -s";

    };
  };
}
