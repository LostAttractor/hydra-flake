{
  description = "ChaosAttractor's Hydra & Nixbuilder Server Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = { nixpkgs, deploy-rs, ... }: rec {
    # Hydra@PVE2.home.lostattractor.net
    nixosConfigurations."hydra@pve2.home.lostattractor.net" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hardware/lxc
        ./configuration/hydra
        { networking.hostName = "Hydra"; }
      ];
    };
    # NixBuilder@PVE.home.lostattractor.net
    nixosConfigurations."nixbuilder@pve.home.lostattractor.net" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hardware/lxc
        ./configuration/nixbuilder
        { networking.hostName = "nixbuilder1"; }
      ];
    };
    # NixBuilder@PVE2.home.lostattractor.net
    nixosConfigurations."nixbuilder@pve2.home.lostattractor.net" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hardware/lxc
        ./configuration/nixbuilder
        { networking.hostName = "nixbuilder2"; }
      ];
    };

    # Deploy-RS Configuration
    deploy = {
      sshUser = "root";
      magicRollback = false;

      nodes."hydra@pve2.home.lostattractor.net" = {
        hostname = "hydra.home.lostattractor.net";
        profiles.system.path = deploy-rs.lib.x86_64-linux.activate.nixos nixosConfigurations."hydra@pve2.home.lostattractor.net";
      };
      nodes."nixbuilder@pve.home.lostattractor.net" = {
        hostname = "nixbuilder1.home.lostattractor.net";
        profiles.system.path = deploy-rs.lib.x86_64-linux.activate.nixos nixosConfigurations."nixbuilder@pve.home.lostattractor.net";
      };
      nodes."nixbuilder@pve2.home.lostattractor.net" = {
        hostname = "nixbuilder2.home.lostattractor.net";
        profiles.system.path = deploy-rs.lib.x86_64-linux.activate.nixos nixosConfigurations."nixbuilder@pve2.home.lostattractor.net";
      };
    };

    # This is highly advised, and will prevent many possible mistakes
    checks = builtins.mapAttrs (_system: deployLib: deployLib.deployChecks deploy) deploy-rs.lib;

    hydraJobs = {
      nixosConfigurations = nixpkgs.lib.mapAttrs' (name: config:
        nixpkgs.lib.nameValuePair name config.config.system.build.toplevel)
        nixosConfigurations;
    };
  };
}
