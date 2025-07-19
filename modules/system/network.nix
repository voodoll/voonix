{variables, ...}: {
  networking = {
    hostName = variables.hostname;
    networkmanager.enable = true;
    timeServers = ["pool.ntp.org"];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        # 22
        # 80
        # 443
        # 25565
        # ...
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
