{pkgs, ...}: {
  home.file = {
    ".config/nvim" = {
      recursive = true;
      source = "${pkgs.my-nvim-config}";
    };
  };

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };

  home = {
    packages = with pkgs; [
      gcc
      nodePackages_latest.npm
      php84Packages.composer
      cargo
      go
      gnumake
      python3
      powershell
    ];
  };
}
