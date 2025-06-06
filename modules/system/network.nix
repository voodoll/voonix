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
    defaultGateway = "192.168.40.1";
    nameservers = ["1.1.1.1" "8.8.8.8"];
    interfaces.eth0.ipv4.addresses = [
      {
        address = "192.168.40.200";
        prefixLength = 24;
      }
    ];
  };
}
