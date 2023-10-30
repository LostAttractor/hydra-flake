{ config, pkgs, ... }:

{
  # Enabling Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" "ca-derivations" ];

  # Substituters
  nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];

  # Store Optimise & Auto Clean
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  # Auto Clean
  nix.extraOptions = ''
    min-free = ${toString (15 * 1024 * 1024 * 1024)}
    max-free = ${toString (30 * 1024 * 1024 * 1024)}
  '';

  # Basic Packages
  environment.systemPackages = with pkgs; [ htop btop duf ];

  system.stateVersion = "23.05";
}

