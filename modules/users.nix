{variables, ...}: {
  nix.settings.allowed-users = [variables.username];
  users.users."${variables.username}" = {
    isNormalUser = true;
    initialPassword = "1234";
    extraGroups = [
      "networkmanager"
      "seat"
      "wheel"
      "video"
      "audio"
      "input"
      "uinput"
    ];
  };
}
