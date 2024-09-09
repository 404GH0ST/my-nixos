{pkgs, ...}: {
  home.file = {
    ".config/bspwm" = {
      recursive = true;
      source = "${pkgs.my-bspwm-config}";
    };
  };
}
