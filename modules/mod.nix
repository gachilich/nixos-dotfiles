{ pkgs, ... }:
{
  virtualisation.docker.enable = true;

  users.users.gachilich.extraGroups = [
    "docker"
  ];
  programs.nix-ld.libraries = with pkgs; [ #for minecraft cleanroom
    vesta-viewer
    vesta
  ];
}
