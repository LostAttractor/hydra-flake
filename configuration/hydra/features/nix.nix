_:
{
  # Enable Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" "ca-derivations" ];

  # Substituters
  nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];

  # Store Optimise & Auto Clean
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 14d";
  };

  # Hydra may overrides trusted-users setting
  nix.settings.trusted-users = [ "root" ];
}