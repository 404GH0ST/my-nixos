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
      nodejs_22
      composer
      cargo
      go
      make
      python3
      powershell
    ];
  };
}
