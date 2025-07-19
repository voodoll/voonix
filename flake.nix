{
  description = "voo's computer";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    disko.url = "github:nix-community/disko";
  };

  outputs = {
    nixpkgs,
    disko,
    ...
  } @ inputs: {
    nixosConfigurations = {
      lounge = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          system = "x86_64-linux";
          version = "25.05";
          variables = {
            hostname = "lounge";
            username = "voo";
            keyboard = "us";
            locale = "en_US.UTF-8";
            timezone = "Europe/London";
          };
        };
        modules = [
          disko.nixosModules.disko
          ./modules
        ];
      };
    };
  };
}
