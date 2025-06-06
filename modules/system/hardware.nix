{
  config,
  lib,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          ControllerMode = "bredr";
          Experimental = true;
        };
      };
    };
  };
  boot = {
    kernelModules = ["kvm-intel"];
    initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
  };
}
