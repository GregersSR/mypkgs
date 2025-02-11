{
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools_scm,
  wheel
}:

buildPythonPackage rec {
  pname = "importlib_resources";
  version = "6.5.2";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GF+Hre9bzCiESdmPtPugfOp4vANkVd1ExfxKL+eP7Sw=";
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
}

