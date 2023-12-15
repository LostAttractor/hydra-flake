_:

{
  # Allowed URIs
  nix.settings.allowed-uris = [
    "github:nixos/"
    "github:NixOS/"
    "github:LostAttractor/"
    "github:nix-community/"
    "github:tpwrules/"
    "github:ryantm/"
    "github:ezKEa/"
    "github:the-argus/"
    "github:hercules-ci/"
    "github:rafaelmardojai/"
    "github:numtide/"
    "github:edolstra/"
    "github:lnl7/"
    "github:oxalica/"
    "github:ipetkov/"
    "github:nix-systems/"
    "github:cachix/"
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
