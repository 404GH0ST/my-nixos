{pkgs, ...}: {
  my-nvim-config = pkgs.callPackage ./nvim {};
}
