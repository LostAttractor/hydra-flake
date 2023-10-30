_:
{
  # Add Firewall Rules for Nix-Serve
  networking.firewall.allowedTCPPorts = [ 5000 ];

  # Nix-Serve
  services.nix-serve = {
    enable = true;
    secretKeyFile = "/var/cache-priv-key.pem";
  };
}