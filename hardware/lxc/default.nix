{ modulesPath, ... }:
{
  # imports = [ (modulesPath + "/virtualisation/lxc-container.nix") ];
  imports = [ ./lxc-container.nix ];

  virtualisation.lxc.nestedContainer = true;

  # Supress systemd units that don't work because of LXC
  systemd.suppressedSystemUnits = [ "sys-kernel-debug.mount" ];
}