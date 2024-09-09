{pkgs, ...}: {
  programs = {
    bat = {
      enable = true;
      catppuccin.enable = true;
    }; 
    zsh = {
      enable = true;
      shellAliases = {
        ls = "lsd";
      };
      syntaxHighlighting.enable = true;
      syntaxHighlighting.catppuccin.enable = true;
      autosuggestion.enable = true;
      history = {
        size = 500000;
      };
      initExtra = ''

      '';
    };
    lazygit.enable = true;
    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
    ripgrep.enable = true;
    btop = {
      enable = true;
      catppuccin.enable = true;
    };
    go.enable = true;
    yazi = {
      enable = true;
      enableZshIntegration = true;
    };
    cava = {
      enable = true;
      catppuccin.enable = true;
    };
  };

  home.packages = with pkgs; [
    service-wrapper
    lsd
    nitch
    wget
    portal
    bore-cli
    fast-cli
    gdu
    zip
    unzip
    pciutils
    gnumake
    nix-output-monitor
    fzf
    jq
    sshs

    python311
    nodejs
    nodePackages.pnpm
    nodePackages.yarn
    rustup
    bun
    nixpkgs-fmt
    air
    templ
    ffmpeg
  ];
}
