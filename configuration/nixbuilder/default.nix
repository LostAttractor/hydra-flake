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

  nix.extraOptions = ''
    min-free = ${toString (15 * 1024 * 1024 * 1024)}
    max-free = ${toString (30 * 1024 * 1024 * 1024)}
  '';

  # nixpkgs.config.contentAddressedByDefault = true;

  # Basic Packages
  environment.systemPackages = with pkgs; [ htop btop bottom micro ];

  system.stateVersion = "23.05";
}

