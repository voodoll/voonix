{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    discord
    stremio
    firefox
  ];

  services.xserver.desktopManager.cinnamon.enable = true;
  services.cinnamon.apps.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts-emoji
    noto-fonts-cjk-sans
    corefonts
  ];
}
