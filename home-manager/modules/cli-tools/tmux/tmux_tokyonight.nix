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
      tokyo-night-tmux
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

      # Configure status elements - simpler format with only window numbers
      set -g window-status-format " #I "
      set -g window-status-style "fg=#565f89,bg=default,dim"
      set -g window-status-last-style "fg=#565f89,bg=default"
      set -g window-status-activity-style "fg=#565f89,bg=default,dim"
      set -g window-status-bell-style "fg=#565f89,bg=default,dim"
      set -g window-status-separator "│"

      # Active window status format - highlight with green
      set -g window-status-current-format " #I "
      set -g window-status-current-style "fg=#9ece6a,bg=default,bold"

      # Pane border look and feel
      setw -g pane-border-status off
      setw -g pane-border-format ""
      setw -g pane-active-border-style "fg=#9ece6a"
      setw -g pane-border-style "fg=#565f89"
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
