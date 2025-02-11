{
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel
}:

buildPythonPackage rec {
  pname = "apyori";
  version = "1.1.2";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4ub/zxRzKxsUMmCM+DuBrFOCQzh7BFjrfZKW53DUYuw=";
  };

  # do not run tests
  doCheck = true;

  # specific to buildPythonPackage, see its reference
  pyproject = true;
  build-system = [
    setuptools
    wheel
  ];
}

