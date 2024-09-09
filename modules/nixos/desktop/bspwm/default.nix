{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      lightdm
      (polybar.override {
        pulseSupport = true;
        nlSupport = true;
      })
    ];

    services = {
      picom = {
        enable = true;
        package = pkgs.unstable.picom;
      };
      redshift.enable = true;
      displayManager.defaultSession = "none+bspwm";
      xserver = {
        enable = true;
        displayManager = {
          lightdm.enable = true;
          lightdm.greeters.mini.enable = true;
        };
        windowManager.bspwm.enable = true;
      };
    };
}
