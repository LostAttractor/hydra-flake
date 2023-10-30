{ config, pkgs, ... }:

{
  # Enabling Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" "ca-derivations" ];

  # Substituters
  nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" "https://cache.ngi0.nixos.org" ];

  nix.settings.trusted-public-keys =  [  "cache.ngi0.nixos.org-1:KqH5CBLNSyX184S9BKZJo1LxrxJ9ltnY2uAs5c/f1MA=" ];

  # Sandbox
  nix.settings.sandbox = true;

  # Store Optimise & Auto Clean
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  nix.extraOptions = ''
    min-free = ${toString (10 * 1024 * 1024 * 1024)}
    max-free = ${toString (20 * 1024 * 1024 * 1024)}
  '';

  # nixpkgs.config.contentAddressedByDefault = true;

  # Basic Packages
  environment.systemPackages = with pkgs; [ htop btop bottom micro ];

  system.stateVersion = "23.05";
}

