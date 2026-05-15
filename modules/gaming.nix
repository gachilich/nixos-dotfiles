{ pkgs, ...}:
{

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
  steam
  lutris
  mangohud
  prismlauncher
  protonup-qt
  antimicrox
 ];

 programs.nix-ld.enable = true;

 programs.nix-ld.libraries = with pkgs; [ #for minecraft cleanroom
  libXi
  libXtst
  libX11
  libXext
  libXrender
  libXrandr
  libXcursor
  libXinerama
  fontconfig
  freetype
  libGL
  openal
  stdenv.cc.cc.lib
];
}
