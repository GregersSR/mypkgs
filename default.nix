{ pkgs ? import <nixpkgs> {} } :
let
  pythonPackages = import ./python pkgs;
in
  {
  inherit pythonPackages;
  }
