{ pkgs, ... }:

{
  imports = [ 
    ./features/nix.nix
    ./features/remote-builds.nix
    ./features/hydra.nix
    ./features/nix-serve.nix
  ];

  # nixpkgs.config.contentAddressedByDefault = true;

  # Basic Packages
  environment.systemPackages = with pkgs; [ htop btop bottom micro ];

  system.stateVersion = "23.05";
}
