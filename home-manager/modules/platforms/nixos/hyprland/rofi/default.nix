{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
		font = "Maple Mono NF CN Bold 13";
    theme =
      with config.lib.stylix.colors.withHashtag;
      builtins.toFile "theme.rasi" ''
        /* ---- 💫 https://github.com/JaKooLit 💫 ---- */
        /* KooL Hyprland Rofi Style 4 */
        /* credit: https://github.com/adi1090x/rofi */

        /*****----- Configuration -----*****/
        configuration {
            modi:                       "drun,run,filebrowser";
            show-icons:                 true;
            display-drun:               "  apps";
            display-run:                "  term";
            display-filebrowser:        "  files";
            display-window:             "  window";
            drun-display-format:        "{name}";
            window-format:              "{w} · {c} · {t}";
            hover-select:               true;
            me-select-entry:            "MouseSecondary";
            me-accept-entry:            "MousePrimary";
        }



        /*****----- Global Properties -----*****/
        * {
            background-alt: ${base00};
            selected:       ${base07};
            active:         ${base06};
            urgent:         ${base0E};
            
            border-color:                ${base06};
            handle-color:                @selected;
            background-color:            ${base00};
            foreground-color:            ${base05};
            alternate-background:        ${base00};
            normal-background:           ${base00};
            normal-foreground:           ${base05};
            urgent-background:           @urgent;
            urgent-foreground:           ${base00};
            active-background:           @active;
            active-foreground:           ${base00};
            selected-normal-background:  @selected;
            selected-normal-foreground:  ${base00};
            selected-urgent-background:  @active;
            selected-urgent-foreground:  ${base00};
            selected-active-background:  @urgent;
            selected-active-foreground:  ${base07};
            alternate-normal-background: ${base00};
            alternate-normal-foreground: ${base05};
            alternate-urgent-background: @urgent;
            alternate-urgent-foreground: ${base00};
            alternate-active-background: @active;
            alternate-active-foreground: ${base00};
            

        }


        /*****----- Main Window -----*****/
        window {
            /* properties for window widget */
            transparency:                "real";
            location:                    center;
            anchor:                      center;
            fullscreen:                  false;
            width:                       35%;
            x-offset:                    0px;
            y-offset:                    0px;

            /* properties for all widgets */
            enabled:                     true;
            margin:                      0px;
            padding:                     0px;
            border:                      0px solid;
            border-radius:               10px;
            border-color:                @border-color;
            cursor:                      "default";
            /* Backgroud Colors */
            background-color:            @background-color;
        }

        /*****----- Main Box -----*****/
        mainbox {
            enabled:                     true;
            spacing:                     10px;
            margin:                      0px;
            padding:                     20px;
            border:                      0px solid;
            border-radius:               0px 0px 0px 0px;
            border-color:                @border-color;
            background-color:            inherit;
            children:                    [ "inputbar", "message", "custombox" ];
        }

        /*****----- A Custom Box -----*****/
        custombox {
            spacing:                     0px;
            background-color:            @background-color;
            text-color:                  @foreground-color;
            orientation:                 horizontal;
            children:                    [ "mode-switcher", "listview" ];
        }

        /*****----- Inputbar -----*****/
        inputbar {
            enabled:                     true;
            spacing:                     10px;
            margin:                      0px;
            padding:                     8px 12px;
            border:                      0px solid;
            border-radius:               8px;
            border-color:                @border-color;
            background-color:            @alternate-background;
            text-color:                  ${base05};
            children:                    [ "textbox-prompt-colon", "entry" ];
        }

        prompt {
            enabled:                     true;
            background-color:            inherit;
            text-color:                  inherit;
        }
        textbox-prompt-colon {
            enabled:                     true;
            padding:                     5px 0px;
            expand:                      false;
            str:                         " 🔎";
            background-color:            inherit;
            text-color:                  inherit;
        }
        entry {
            enabled:                     true;
            padding:                     5px 0px;
            background-color:            @alternate-background;
            text-color:                  ${base05};
            cursor:                      text;
            placeholder:                 "Search...";
            placeholder-color:           inherit;
        }
        num-filtered-rows {
            enabled:                     true;
            expand:                      false;
            background-color:            inherit;
            text-color:                  inherit;
        }
        textbox-num-sep {
            enabled:                     true;
            expand:                      false;
            str:                         "/";
            background-color:            inherit;
            text-color:                  inherit;
        }
        num-rows {
            enabled:                     true;
            expand:                      false;
            background-color:            inherit;
            text-color:                  inherit;
        }
        case-indicator {
            enabled:                     true;
            background-color:            inherit;
            text-color:                  inherit;
        }

        /*****----- Listview -----*****/
        listview {
            enabled:                     true;
            columns:                     1;
            lines:                       6;
            cycle:                       true;
            dynamic:                     true;
            scrollbar:                   false;
            layout:                      vertical;
            reverse:                     false;
            fixed-height:                true;
            fixed-columns:               true;
            
            spacing:                     5px;
            margin:                      0px;
            padding:                     10px;
            border:                      2px 2px 2px 2px;
            border-radius:               8px;
            border-color:                @border-color;
            background-color:            transparent;
            text-color:                  @foreground-color;
            cursor:                      "default";
        }
        scrollbar {
            handle-width:                2px ;
            handle-color:                @handle-color;
            border-radius:               10px;
            background-color:            @alternate-background;
        }

        /*****----- Elements -----*****/
        element {
            enabled:                     true;
            spacing:                     10px;
            margin:                      0px;
            padding:                     10px;
            border:                      0px solid;
            border-radius:               8px;
            border-color:                @border-color;
            background-color:            transparent;
            text-color:                  @foreground-color;
            cursor:                      pointer;
        }
        element normal.normal {
            background-color:            transparent;
            text-color:                  @normal-foreground;
        }
        element normal.urgent {
            background-color:            @urgent-background;
            text-color:                  @urgent-foreground;
        }
        element normal.active {
            background-color:            transparent;
            text-color:                  @active-foreground;
        }

        element-text selected,
        element selected.normal {
            background-color:            @selected-normal-background;
            text-color:                  @selected-normal-foreground;
        }
        element selected.urgent {
            background-color:            @selected-urgent-background;
            text-color:                  @selected-urgent-foreground;
        }
        element selected.active {
            background-color:            @selected-active-background;
            text-color:                  @selected-active-foreground;
        }
        element alternate.normal {
            background-color:            @alternate-normal-background;
            text-color:                  @alternate-normal-foreground;
        }
        element alternate.urgent {
            background-color:            @alternate-urgent-background;
            text-color:                  @alternate-urgent-foreground;
        }
        element alternate.active {
            background-color:            @alternate-active-background;
            text-color:                  @alternate-active-foreground;
        }
        element-icon {
            background-color:            transparent;
            text-color:                  inherit;
            cursor:                      inherit;
        }
        element-text {
            background-color:            transparent;
            text-color:                  inherit;
            highlight:                   inherit;
            cursor:                      inherit;
            vertical-align:              0.5;
            horizontal-align:            0.0;
        }

        /*****----- Mode Switcher -----*****/
        mode-switcher{
            enabled:                     true;
            expand:                      false;
            orientation:                 vertical;
            spacing:                     0px;
            margin:                      0px;
            padding:                     0px 0px;
            border:                      0px solid;
            border-radius:               8px 0px 0px 8px;
            border-color:                @border-color;
            background-color:            @alternate-background;
            text-color:                  @foreground-color;
        }
        button {
            padding:                     0px 20px 0px 20px;
            border:                      0px 0px 0px 0px;
            border-radius:               8px;
            border-color:                @border-color;
            background-color:            transparent;
            text-color:                  inherit;
            vertical-align:              0.5;
            horizontal-align:            0.0;
            cursor:                      pointer;
        }
        button selected {
            border:                      2px 0px 2px 2px;
            border-radius:               6px;
            border-color:                @border-color;
            background-color:            @selected-normal-foreground;
            text-color:                  @selected-normal-background;
        }

        /*****----- Message -----*****/
        message {
            enabled:                     true;
            margin:                      0px;
            padding:                     0px;
            border:                      0px solid;
            border-radius:               0px 0px 0px 0px;
            border-color:                @border-color;
            background-color:            transparent;
            text-color:                  @foreground-color;
        }
        textbox {
            padding:                     12px;
            border:                      0px solid;
            border-radius:               8px;
            border-color:                @border-color;
            background-color:            @color0;
            text-color:                  @background-color;
            vertical-align:              0.5;
            horizontal-align:            0.5;
            highlight:                   none;
            placeholder-color:           @foreground-color;
            blink:                       true;
            markup:                      true;
        }
        error-message {
            padding:                     10px;
            border:                      2px solid;
            border-radius:               8px;
            border-color:                @border-color;
            background-color:            @background-color;
            text-color:                  @foreground-color;
        }
        				'';
  };
}
