{pkgs, ...}: {
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    dataDir = "/var/lib/minecraft";

    servers = {
      voocraft = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_4;
        serverProperties = {
          server-port = 25565;
          gamemode = "survival";
          difficulty = "hard";
          simulation-distance = 10;
          # more options here ...
        };
        whitelist = {
          # add people here
        };
        symlinks = {
          "mods" = ./mods;
        };
      };
    };
  };
}
