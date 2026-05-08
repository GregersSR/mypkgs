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
      pkgs = unpatchedPkgs;
      packages = import ./default.nix { inherit pkgs;};
    in {
      packages.x86_64-linux = packages;
    };
}
