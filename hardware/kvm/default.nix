{ ... }:

{
  # Include the results of the hardware scan.
  imports = [ ./hardware-configuration.nix ];

  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # Enable ZRAM
  zramSwap.enable = true;
  
  # SSH
  services.openssh.enable = true;
}