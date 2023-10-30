{ pkgs, ... }:

{
  imports = [
    ./features/nix.nix
    ./features/remote-builds.nix
    ./features/hydra.nix
    ./features/nix-serve.nix
    ./features/nginx.nix
  ];

  # Basic Packages
  environment.systemPackages = with pkgs; [ htop btop duf ];

  system.stateVersion = "23.05";
}