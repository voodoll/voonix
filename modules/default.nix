{...}: {
  imports = [
    ./system
    ./configuration.nix
    ./users.nix
    ./minecraft/servers.nix
  ];
}
