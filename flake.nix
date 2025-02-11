{
  description = "Repository of @gsr's custom packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      packages = import ./default.nix { inherit pkgs;};
    in {
      packages.x86_64-linux = packages // { default = packages.pythonPackages.dtuimldmtools; };
    };
}
