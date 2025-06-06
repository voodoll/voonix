{variables, ...}: {
  nix.settings.allowed-users = [variables.user];
  users.users."${variables.user}" = {
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
