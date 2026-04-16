{ flakePkgs, system }: 
let
  pkgs = flakePkgs.legacyPackages.${system};
in
{
  patch = patches: 
    let
      drv = pkgs.applyPatches {
        src = pkgs.path;
        inherit patches;
      };
    in
      (import drv { inherit (pkgs.stdenv) system; });
}

