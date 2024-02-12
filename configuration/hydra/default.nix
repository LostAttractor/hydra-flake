{ pkgs, ... }:

{
  imports = [ 
    ./features/nix.nix
    ./features/remote-builds.nix
    ./features/hydra.nix
    ./features/nix-serve.nix
    ./features/nginx.nix
    ./features/prometheus.nix
  ];

  boot.tmp.useTmpfs = true;

  users = {
    # Don't allow mutation of users outside of the config.
    mutableUsers = false;
    # Privilege User
    users.root.openssh.authorizedKeys.keys = [ "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBC5HypvbsI4xvwfd4Uw7D+SV0AevYPS/nCarFwfBwrMHKybbqUJV1cLM1ySZPxXcZD7+3m48Riiwlssh6o7WM/M= openpgp:0xDE4C24F6" ];
  };

  # nixpkgs.config.contentAddressedByDefault = true;

  # Basic Packages
  environment.systemPackages = with pkgs; [ htop btop bottom micro ];

  system.stateVersion = "24.05";
}
