{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    discord
    stremio
    firefox
    spotify
  ];

  services.xserver.desktopManager.cinnamon.enable = true;
  services.cinnamon.apps.enable = true;

  programs = {
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
