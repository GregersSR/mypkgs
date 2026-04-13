pkgs:
  with pkgs;
  with python3Packages;
  let
    apyori = callPackage ./apyori.nix {};
    importlib_resources = callPackage ./importlib_resources.nix {};
    pyzotero = callPackage ./pyzotero.nix {};
  in
  {
    inherit apyori;
    inherit importlib_resources;
    inherit pyzotero;
    dtuimldmtools = callPackage ./dtuimldmtools.nix { inherit apyori; inherit importlib_resources; };
    zotero-mcp-server = callPackage ./zotero-mcp-server.nix { inherit pyzotero; };
  }
