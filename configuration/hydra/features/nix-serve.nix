{ pkgs, config, ... }:
{
  # Nix-Serve
  services.nix-serve = {
    enable = true;
    package = pkgs.nix-serve-ng;
    secretKeyFile = config.sops.secrets."nix-serve/privkey".path;
  };

  sops.secrets."nix-serve/privkey" = {};
  # pubkey: binarycache.home.lostattractor.net:nB258qoytYrdCe2pcI6qJ/M9R0l7Q5l9Bu5ryCbzItc=
}