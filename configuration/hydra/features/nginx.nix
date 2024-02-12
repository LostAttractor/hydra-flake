{ config, ... }:
{
  # Add Firewall Rules for Nginx
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      "hydra.home.lostattractor.net" = {
        locations."/".proxyPass = config.services.hydra.hydraURL;
        forceSSL = true;
        enableACME = true;
      };
      "binarycache.home.lostattractor.net" = {
        locations."/".proxyPass = "http://${config.services.nix-serve.bindAddress}:${toString config.services.nix-serve.port}";
        forceSSL = true;
        enableACME = true;
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "lostattractor@gmail.com";
  };
}