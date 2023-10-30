{ modulesPath, config, pkgs, ... }:

{
  # Allowed URIs
  nix.settings.allowed-uris = [
    "https://github.com"
    "https://api.github.com"
    "https://git.sr.ht"
  ];

  # Add Firewall Rules for Hydra
  networking.firewall.allowedTCPPorts = [ 3000 ];

  # Hydra
  services.hydra = {
    enable = true;
    hydraURL = "http://hydra.home.lostattractor.net:3000";
    notificationSender = "hydra@lostattractor.net";
    useSubstitutes = true;
    extraConfig = ''
      max_output_size = 8589934591 # 1024^3*8-1
    '';
  };
}
