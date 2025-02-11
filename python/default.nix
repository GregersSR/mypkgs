pkgs:
  with pkgs;
  with python3Packages;
  let
    apyori = callPackage ./apyori.nix {
      inherit buildPythonPackage;
      inherit fetchPypi;
      inherit setuptools;
      inherit wheel;
    };
    importlib_resources = callPackage ./importlib_resources.nix {
      inherit buildPythonPackage;
      inherit fetchPypi;
      inherit setuptools;
      inherit setuptools_scm;
      inherit wheel;
    };
  in
  {
    inherit apyori;
    inherit importlib_resources;
    dtuimldmtools = callPackage ./dtuimldmtools.nix (with python3Packages; {
      inherit buildPythonPackage;
      inherit fetchPypi;
      inherit setuptools;
      inherit setuptools_scm;
      inherit wheel;

      inherit matplotlib;
      inherit scikit-learn;
      inherit numpy;
      inherit torch;
      inherit nltk;
      inherit xlrd;
      inherit scipy;
      inherit apyori;
      inherit pandas;
      inherit importlib_resources;
    });
  }
