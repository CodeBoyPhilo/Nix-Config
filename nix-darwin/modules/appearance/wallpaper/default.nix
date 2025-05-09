_:
let
  wallpaper_path = ./wallpapers/codeboyphilo_dark.png;
in
{
  homebrew = {
    casks = [ "desktoppr" ];
  };

  system.activationScripts.postActivation.text = ''
        echo "Setting wallpaper to ${wallpaper_path}..."
    		/usr/local/bin/desktoppr ${wallpaper_path}
  '';
}
