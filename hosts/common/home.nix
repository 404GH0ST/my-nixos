{
  outputs,
  username,
  ...
}: {
  imports = [
    ../../modules/home-manager/shell
    ../../modules/home-manager/git
    ../../modules/home-manager/nvim
    ../../modules/home-manager/tmux
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.nur
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      joypixels.acceptLicense = true;
    };
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
