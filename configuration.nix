{ self, inputs, modulesPath, lib, pkgs, ... }: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    inputs.disko.nixosModules.disko
    ./disk-config.nix
  ];

  system.stateVersion = "24.09";

  nixpkgs.hostPlatform = "x86_64-linux";

  hardware.enableRedistributableFirmware = true;

  # give your machine a network name
  networking.hostName = "devbox";

  time.timeZone = "Africa/Lagos";

  environment.systemPackages = with pkgs; [ vim git ];

  networking.useDHCP = true;

  boot.kernelParams = [ "net.ifnames=0" ];

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  # update the user (admin)
  users.users.admin = {
    isNormalUser = true;
    # update the ssh public key
    openssh.authorizedKeys.keys = [ "ssh-ed25519 XXXX" ];
    extraGroups = [ "wheel" ];
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    extraConfig = ''
      PrintLastLog no
    '';
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
