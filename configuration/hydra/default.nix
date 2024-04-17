{ pkgs, ... }:

{
  imports = [
    ../features/prometheus.nix
    ./features/nix.nix
    ./features/builders.nix
    ./features/hydra.nix
    ./features/nix-serve.nix
    ./features/nginx.nix
    ./secrets/nix/access-tokens.nix
  ];

  sops.defaultSopsFile = ../../secrets/hydra.yaml;

  users = {
    # Don't allow mutation of users outside of the config.
    mutableUsers = false;
    # Privilege User
    users.root.openssh.authorizedKeys.keys = [ "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBC5HypvbsI4xvwfd4Uw7D+SV0AevYPS/nCarFwfBwrMHKybbqUJV1cLM1ySZPxXcZD7+3m48Riiwlssh6o7WM/M= openpgp:0xDE4C24F6" ];
  };

  # Basic Packages
  environment.systemPackages = with pkgs; [ htop btop duf ];

  system.stateVersion = "24.05";
}