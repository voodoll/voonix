{config, ...}: {
  networking = {
    hostName = config.opts.hostname;
    networkmanager.enable = true;
    timeServers = ["pool.ntp.org"];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        # 22
        # 80
        # 443
        # 59010
        # 59011
        # 8080
      ];
      allowedUDPPorts = [
        # 59010
        # 59011
      ];
    };
  };
}
