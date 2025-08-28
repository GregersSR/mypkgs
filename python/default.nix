pkgs:
  with pkgs;
  with python3Packages;
  let
    apyori = callPackage ./apyori.nix {};
    importlib_resources = callPackage ./importlib_resources.nix {};
  in
  {
    inherit apyori;
    inherit importlib_resources;
    dtuimldmtools = callPackage ./dtuimldmtools.nix { inherit apyori; inherit importlib_resources; };
  }
