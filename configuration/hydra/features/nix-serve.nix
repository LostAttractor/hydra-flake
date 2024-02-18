{ pkgs, ... }:
{
  # Nix-Serve
  services.nix-serve = {
    enable = true;
    package = pkgs.nix-serve-ng;
    secretKeyFile = "/var/cache-priv-key.pem";
  };
}