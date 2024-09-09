{pkgs, ...}: {
  my-nvim-config = pkgs.callPackage ./nvim {};
  my-bspwm-config = pkgs.callPackage ./bspwm {};
  my-sxhkd-config = pkgs.callPackage ./sxhkd {};
}
