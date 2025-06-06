{
  variables,
  version,
  inputs,
  pkgs,
  ...
}: {
  services = {
    xserver.xkb.layout = "${variables.kb}";
    flatpak.enable = true;
  };

  time.timeZone = "${variables.locale}";

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
  };

  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      auto-optimise-store = true;
      use-xdg-base-directories = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  xdg.mime.enable = true;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = 1;
      # XDG_DIRS
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";

      MOZ_ENABLE_WAYLAND = 1;
    };
    variables = {
      NH_FLAKE = "$HOME/.nix";
    };
    systemPackages = with pkgs; [
      nix-output-monitor
      nvd
      killall
      perlPackages.FileMimeInfo
      pkg-config
      usbutils
      v4l-utils

      # archives
      p7zip
      unrar
      unzip
      zip
    ];
  };

  users.mutableUsers = true;
  qt.enable = true;

  i18n = with variables; {
    defaultLocale = "${locale}";
    extraLocaleSettings = {
      LC_ADDRESS = "${locale}";
      LC_IDENTIFICATION = "${locale}";
      LC_MEASUREMENT = "${locale}";
      LC_MONETARY = "${locale}";
      LC_NAME = "${locale}";
      LC_NUMERIC = "${locale}";
      LC_PAPER = "${locale}";
      LC_TELEPHONE = "${locale}";
      LC_TIME = "${locale}";
    };
  };

  console.keyMap = "${variables.keyboard}";
  system.stateVersion = version;

  security = {
    # rtkit.enable = true;
    polkit.enable = true;
    pam.services = {
      greetd.enableKwallet = true;
    };
  };

  services = {
    printing = {
      enable = true;
      drivers = [
        # pkgs.hplipWithPlugin
      ];
    };
    avahi = {
      enable = true;
      openFirewall = true;
    };
    ipp-usb.enable = true;
    libinput.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    seatd.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    udev.enable = true;
  };

  programs = {
    dconf.enable = true;
    fuse.userAllowOther = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
    };
    mtr.enable = true;
    seahorse.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
