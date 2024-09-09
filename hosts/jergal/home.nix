{pkgs, ...}: {
  imports = [
    ../common/home.nix
    ../../modules/home-manager/bspwm
    ../../modules/home-manager/sxhkd
    ../../modules/home-manager/alacritty
    # ../../modules/home-manager/picom
    # ../../modules/home-manager/wezterm
    # ../../modules/home-manager/rofi
    # ../../modules/home-manager/barrier
    # ../../modules/home-manager/firefox
    # ../../modules/home-manager/kdeconnect
    # ../../modules/home-manager/vs-code
    # ../../modules/home-manager/mopidy
  ];

  catppuccin.flavor = "mocha";
  catppuccin.accent = "mauve";

  catppuccin.pointerCursor.enable = true;

  qt.enable = true;
  qt.style.catppuccin.enable = true;

  gtk = {
    catppuccin = {
      enable = true;
      icon.enable = true;
    };
  };

  home.packages = with pkgs; [
    discord
    vlc
    gimp
    obs-studio
    flameshot
    chromium
    libreoffice-qt
    spotify
    stremio
  ];
}
