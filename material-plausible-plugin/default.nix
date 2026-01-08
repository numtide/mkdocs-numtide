{ buildPythonPackage
, fetchPypi
, lib
, mkdocs
, mkdocs-material
}:

buildPythonPackage rec {
  pname = "material-plausible-plugin";
  version = "0.3.0";
  format = "wheel";

  src = fetchPypi {
    inherit version format;
    pname = "material_plausible_plugin";
    dist = "py3";
    python = "py3";
    hash = "sha256-Thy68O74bb00+vovJYMJYEFsmJ+A4LHR+rzu1s9rQKo=";
  };

  propagatedBuildInputs = [
    mkdocs
    mkdocs-material
  ];

  pythonImportsCheck = [ "material_plausible" ];

  meta = with lib; {
    description = "Plausible Analytics implementation for Material for MkDocs";
    homepage = "https://codeberg.org/notpushkin/material-plausible-plugin";
    license = licenses.isc;
  };
}
