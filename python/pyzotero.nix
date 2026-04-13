{ lib
, fetchurl
, pkgs
}:

let
  python3Packages = pkgs.python3Packages;
  version = "1.11.0";
  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/d5/c1/9604acb98817b0687eb2ff1eda0b3d765d08c70471064ff9526f63e10274/pyzotero-${version}.tar.gz";
    sha256 = "1cvzckmfbzqln9i4pm3f43578wrjwb40r0g7gyx4ckyljyi5q7lh";
  };
in
python3Packages.buildPythonPackage rec {
  pname = "pyzotero";
  inherit version src;

  pyproject = true;

  build-system = with python3Packages; [ uv-build ];

  propagatedBuildInputs = with python3Packages; [
    feedparser
    bibtexparser
    httpx
    whenever
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.8.14,<0.9.0" "uv_build>=0.8.14"
  '';

  meta = with lib; {
    description = "Python wrapper for the Zotero API";
    homepage = "https://github.com/urschrei/pyzotero";
    license = licenses.blueOak100;
  };
}
