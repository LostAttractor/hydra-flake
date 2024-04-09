_:
{
  nix.buildMachines = [
    # Build small parallel locally
    # Hydra does not use the local machine when buildMachinesFiles is set
    {
      hostName = "localhost";
      systems = [ "x86_64-linux" "i686-linux" ];
      maxJobs = 16;
      speedFactor = 4;
      supportedFeatures = [ "kvm" "nixos-test" "ca-derivations" "benchmark" ];
      mandatoryFeatures = [ ];
    }
    {
      hostName = "nixremote@nixbuilder1.home.lostattractor.net";
      systems = [ "x86_64-linux" "i686-linux" ];
      maxJobs = 1;
      speedFactor = 2;
      supportedFeatures = [ "kvm" "nixos-test" "ca-derivations" "benchmark" "big-parallel" ];
      mandatoryFeatures = [ ];
    }
    {
      hostName = "nixremote@nixbuilder2.home.lostattractor.net";
      systems = [ "x86_64-linux" "i686-linux" ];
      maxJobs = 1;
      speedFactor = 4;
      supportedFeatures = [ "kvm" "nixos-test" "ca-derivations" "benchmark" "big-parallel" ];
      mandatoryFeatures = [ ];
    }
  ];
  nix.distributedBuilds = true;
  # Optional, useful when the builder has a faster internet connection than yours
  nix.settings.builders-use-substitutes = true;
}