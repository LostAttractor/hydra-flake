{ modulesPath, config, pkgs, ... }:

{
  # Allowed URIs
  nix.settings.allowed-uris = [
    "https://github.com"
    "https://api.github.com"
    "https://git.sr.ht"
  ];

  # Hydra
  services.hydra = {
    enable = true;
    hydraURL = "http://hydra.home.lostattractor.net:3000";
    notificationSender = "hydra@lostattractor.net";
    useSubstitutes = true;
    extraConfig = ''
      max_output_size = 34359738367 # 1024^3 * 32 - 1
    '';
  };
}
