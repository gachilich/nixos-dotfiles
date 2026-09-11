{ pkgs, ... }:

let
  spotiflac = pkgs.callPackage ../packages/spotiflac.nix { };
in
{
  environment.systemPackages = [ spotiflac ];
}
