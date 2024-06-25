_:
let
  systems = [
    "x86_64-linux"
    "i686-linux"
    "aarch64-linux"
  ];
  supportedFeatures = [
    "nixos-test"
    "benchmark"
    "big-parallel"
    "kvm"
    "nix-command"
    "flakes"
    "ca-derivations"
  ];
in
{
  nix.buildMachines = [
    # Build small parallel locally
    # Hydra does not use the local machine when buildMachinesFiles is set
    {
      hostName = "localhost";
      protocol = null;
      systems = systems;
      maxJobs = 8;
      speedFactor = 4;
      supportedFeatures = supportedFeatures;
      mandatoryFeatures = [ ];
    }
    {
      hostName = "nixremote@nixbuilder1.home.lostattractor.net";
      systems = systems;
      maxJobs = 2;
      speedFactor = 2;
      supportedFeatures = supportedFeatures;
      mandatoryFeatures = [ ];
    }
  ];
  nix.distributedBuilds = true;
  # Optional, useful when the builder has a faster internet connection than yours
  nix.settings.builders-use-substitutes = true;
}