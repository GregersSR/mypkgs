{ lib
, fetchurl
, pkgs
, pyzotero
}:

let
  version = "0.3.0";
  src = fetchurl {
    url = "https://github.com/54yyyu/zotero-mcp/archive/refs/tags/v${version}.tar.gz";
    sha256 = "1327gh01llmlx3xxipbvfkqbdgzgaanymkvjv739vvb17mcl5nw9";
  };
  python3Packages = pkgs.python3Packages;
in
python3Packages.buildPythonPackage rec {
  pname = "zotero-mcp-server";
  inherit version src;

  pyproject = true;

  doCheck = false;

  build-system = with python3Packages; [ hatchling ];

  propagatedBuildInputs = [ pyzotero ] ++ (with python3Packages; [
    mcp
    python-dotenv
    markitdown
    pydantic
    requests
    fastmcp
    unidecode
    pymupdf
    ebooklib
  ]);

  postInstall = ''
    ln -sf $out/bin/zotero-mcp $out/bin/zotero-mcp-server
  '';

  meta = with lib; {
    description = "Model Context Protocol server for Zotero";
    homepage = "https://github.com/54yyyu/zotero-mcp";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
