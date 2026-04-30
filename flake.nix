{
  description = "Repository of @gsr's custom packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      myLib = import ./lib.nix { flakePkgs = nixpkgs; inherit system; };
      unpatchedPkgs = nixpkgs.legacyPackages.${system};
      pkgs = myLib.patch [
      # Patch to "merge in" PR 510339 to update fastmcp to >3.0
          (unpatchedPkgs.fetchpatch2 {
            url = "https://github.com/NixOS/nixpkgs/compare/28a868327158313f3a38f775e13866979da79cca...977ebf6a890866ac9cc67d48b4f876c1c3dee652.diff?full_index=1";
            hash = "sha256-g50+6Ib4vft7oCMkx1d+hxGTqnS0vop/M7yrEv6ddzM=";
          })
      ];
      packages = import ./default.nix { inherit pkgs;};
    in {
      packages.x86_64-linux = packages;
    };
}
