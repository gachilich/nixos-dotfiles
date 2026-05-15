{ inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };

    users.gachilich = {
      imports = [
        (inputs."import-tree" "${inputs.self}/home-modules")
      ];
    };
  };
}
