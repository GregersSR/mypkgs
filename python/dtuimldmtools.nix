{
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools_scm,
  wheel,

  matplotlib,
  scikit-learn,
  numpy,
  pandas,
  torch,
  nltk,
  xlrd,
  scipy,
  apyori,
  importlib_resources,
}:

buildPythonPackage rec {
  pname = "dtuimldmtools";
  version = "0.1.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-a/7hyqDynxE6Lco2oxrhMZhCILECab2LxGTqg448Zl4=";
  };

  # do not run tests
  doCheck = true;

  # specific to buildPythonPackage, see its reference
  pyproject = true;
  build-system = [
    setuptools
    setuptools_scm
    wheel
  ];

  dependencies = [
    matplotlib
    scikit-learn
    numpy
    torch
    nltk
    xlrd
    scipy
    apyori
    pandas
    importlib_resources
  ];
}

