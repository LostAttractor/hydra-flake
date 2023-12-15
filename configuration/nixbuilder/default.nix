{ pkgs, ... }:

{
  # Enabling Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" "ca-derivations" ];

  # Substituters
  nix.settings.substituters = [ "https://binarycache.home.lostattractor.net" "https://mirror.sjtu.edu.cn/nix-channels/store" "https://cache.ngi0.nixos.org" ];

  nix.settings.trusted-public-keys =  [ "binarycache.home.lostattractor.net:nB258qoytYrdCe2pcI6qJ/M9R0l7Q5l9Bu5ryCbzItc=" "cache.ngi0.nixos.org-1:KqH5CBLNSyX184S9BKZJo1LxrxJ9ltnY2uAs5c/f1MA=" ];

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

  users = {
    # Don't allow mutation of users outside of the config.
    mutableUsers = false;
    # Privilege User
    users.root.openssh.authorizedKeys.keys = [ "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBC5HypvbsI4xvwfd4Uw7D+SV0AevYPS/nCarFwfBwrMHKybbqUJV1cLM1ySZPxXcZD7+3m48Riiwlssh6o7WM/M= openpgp:0xDE4C24F6" ];

  # nixpkgs.config.contentAddressedByDefault = true;

  # Basic Packages
  environment.systemPackages = with pkgs; [ htop btop bottom micro ];

  system.stateVersion = "23.05";
}

