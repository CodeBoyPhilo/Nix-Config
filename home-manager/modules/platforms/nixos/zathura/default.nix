{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    zathura
  ];

  programs.zathura = {
    enable = true;
    # options = {
    #   default-fg = "rgba(76,79,105,1)";
    #   default-bg = "rgba(239,241,245,1)";
    #
    #   completion-bg = "rgba(204,208,218,1)";
    #   completion-fg = "rgba(76,79,105,1)";
    #   completion-highlight-bg = "rgba(136,57,239,1)";
    #   completion-highlight-fg = "rgba(239,241,245,1)";
    #   completion-group-bg = "rgba(230,233,239,1)";
    #   completion-group-fg = "rgba(76,79,105,1)";
    #
    #   statusbar-fg = "rgba(76,79,105,1)";
    #   statusbar-bg = "rgba(220,224,232,1)";
    #   inputbar-fg = "rgba(76,79,105,1)";
    #   inputbar-bg = "rgba(239,241,245,1)";
    #
    #   notification-bg = "rgba(239,241,245,1)";
    #   notification-fg = "rgba(76,79,105,1)";
    #   notification-error-bg = "rgba(239,241,245,1)";
    #   notification-error-fg = "rgba(210,15,57,1)";
    #   notification-warning-bg = "rgba(239,241,245,1)";
    #   notification-warning-fg = "rgba(223,142,29,1)";
    #
    #   recolor = true;
    #   recolor-lightcolor = "rgba(239,241,245,1)";
    #   recolor-darkcolor = "rgba(76,79,105,1)";
    #
    #   index-fg = "rgba(76,79,105,1)";
    #   index-bg = "rgba(239,241,245,1)";
    #   index-active-fg = "rgba(76,79,105,1)";
    #   index-active-bg = "rgba(204,208,218,1)";
    #
    #   render-loading-bg = "rgba(239,241,245,1)";
    #   render-loading-fg = "rgba(76,79,105,1)";
    #
    #   highlight-color = "rgba(124,127,147,0.3)";
    #   highlight-fg = "rgba(76,79,105,1)";
    #   highlight-active-color = "rgba(136,57,239,0.3)";
    # };
  };
}
