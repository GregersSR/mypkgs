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
          (unpatchedPkgs.fetchpatch2 {
            url = "https://github.com/NixOS/nixpkgs/compare/28a868327158313f3a38f775e13866979da79cca...977ebf6a890866ac9cc67d48b4f876c1c3dee652.diff?full_index=1";
            hash = "sha256-g50+6Ib4vft7oCMkx1d+hxGTqnS0vop/M7yrEv6ddzM=";
          })
          (unpatchedPkgs.fetchpatch2 {
            url = "https://github.com/NixOS/nixpkgs/commit/e8e221ab76893ba5d7c54b86662a01b461c74fac.diff";
            hash = "sha256-Gm5P3eNmD+weDKs5rqVDd6QYO11AF3ZVA2HrGuLvFKE=";
          })
      ];
      packages = import ./default.nix { inherit pkgs;};
    in {
      packages.x86_64-linux = packages;
    };
}
