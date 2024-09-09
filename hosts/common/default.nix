{
  pkgs,
  username,
  outputs,
  config,
  ...
}: {
  imports = [
    ../../modules/nixos/sops.nix
  ];

  sops.secrets.my-password = {
    sopsFile = ./secrets.yaml;
    neededForUsers = true;
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.nur
    ];

    config = {
      allowUnfree = true;
      joypixels.acceptLicense = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  time.timeZone = "Asia/Jakarta";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_ID";
      LC_IDENTIFICATION = "en_ID";
      LC_MEASUREMENT = "en_ID";
      LC_MONETARY = "en_ID";
      LC_NAME = "en_ID";
      LC_NUMERIC = "en_ID";
      LC_PAPER = "en_ID";
      LC_TELEPHONE = "en_ID";
      LC_TIME = "en_ID";
    };
  };

  programs = {
    zsh.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 5d --keep 5";
      flake = "/home/${username}/Linux_Rice/my-nixos";
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };

  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      hashedPasswordFile = config.sops.secrets.my-password.path;
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "storage"];
      openssh.authorizedKeys.keys = [
        ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG0mgDpfR/CesopO7NNRS0geAqZt7oABzfTwmeBfaqan agus@404Gh0st''
      ];
    };
  };
}
