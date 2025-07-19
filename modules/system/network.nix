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
  };
}
