{ lib, ... }:

{
  home.file = {
    ".config/hypr/userprefs.conf" = lib.mkForce {
      text = ''
        monitor = HDMI-A-1, 3840x2160@60, 0x0, 1.5
        monitor = DP-2, 2560x1440@180, 2560x0, 1 , bitdepth, 10

        # Hyprland window rules
        windowrulev2 = opacity 1.00 $& 1.00 $& 1, class:(firefox), title:(.*YouTube.*)
        windowrulev2 = opacity 1.00 $& 1.00 $& 1, title:(Picture-in-Picture)
        windowrulev2 = opacity 1.00 $& 1.00 $& 1, class:(firefox), title:(Netflix.*)

        # Assign workspace 1 to left monitor
        workspace = 1, monitor:HDMI-A-1
        workspace = 2, monitor:HDMI-A-1
        # Assign workspaces 2-9 to right monitor
        workspace = 3, monitor:DP-2
        workspace = 4, monitor:DP-2
        workspace = 5, monitor:DP-2
        workspace = 6, monitor:DP-2
        workspace = 7, monitor:DP-2
        workspace = 8, monitor:DP-2
        workspace = 9, monitor:DP-2
      '';
      force = true;
      mutable = true;
    };
  };
}
