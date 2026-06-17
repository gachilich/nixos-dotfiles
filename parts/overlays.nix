{ inputs,  ... }:
{
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.pinned
    (final: prev: {
    openldap = prev.openldap.overrideAttrs (_: { doCheck = false; });
    })
  ];
}
