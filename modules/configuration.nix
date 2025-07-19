{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    discord
    stremio
    firefox
    spotify
    rustdesk
  ];

  services = {
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.cinnamon.enable = true;
    };
    cinnamon.apps.enable = true;
  };

  programs = {
    git.enable = true;
    vim.enable = true;
    java = {
      enable = true;
      package = pkgs.jre8;
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts-emoji
    noto-fonts-cjk-sans
    corefonts
  ];
}
