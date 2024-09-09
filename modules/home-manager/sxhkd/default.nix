{pkgs, ...}: {
  home.file = {
    ".config/sxhkd" = {
      recursive = true;
      source = "${pkgs.my-sxhkd-config}";
    };
  };
}
