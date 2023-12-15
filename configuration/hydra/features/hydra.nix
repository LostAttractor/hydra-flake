_:

{
  # Allowed URIs
  # TODO: https://nixos.org/manual/nix/stable/release-notes/rl-2.20
  nix.settings.allowed-uris = [ "github:" "https:" ];

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
