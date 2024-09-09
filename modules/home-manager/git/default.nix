{...}: {
  programs.git = {
    enable = true;
    userName = "404GH0ST";
    userEmail = "60356707+404GH0ST@users.noreply.github.com";
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgSign = true;
      gpg.format = "ssh";
    };
  };
}
