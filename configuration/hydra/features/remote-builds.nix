{ modulesPath, config, pkgs, ... }:

{
  # Remote Builds
  nix.buildMachines = [
    {
      hostName = "root@nixbuilder1.home.lostattractor.net";
      systems = [ "x86_64-linux" "i686-linux" ];
      maxJobs = 2;
      speedFactor = 2;
      supportedFeatures = [ "kvm" "nixos-test" "ca-derivations" "benchmark" "big-parallel" ];
      mandatoryFeatures = [ ];
    }
    {
      hostName = "root@nixbuilder2.home.lostattractor.net";
      systems = [ "x86_64-linux" "i686-linux" ];
      maxJobs = 3;
      speedFactor = 4;
      supportedFeatures = [ "kvm" "nixos-test" "ca-derivations" "benchmark" "big-parallel" ];
      mandatoryFeatures = [ ];
    }
  ];
  nix.distributedBuilds = true;
  # Optional, useful when the builder has a faster internet connection than yours
  nix.settings.builders-use-substitutes = true;

  # Disallow building on local system
  nix.settings.max-jobs = 0;
}