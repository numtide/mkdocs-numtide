{ buildPythonPackage
, fetchFromGitHub
, isPy3k
, lib
, fetchPypi
, pytest
, jsonschema
}:

buildPythonPackage rec {
  pname = "validator-collection";
  version = "1.5.0";

  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+TlcrZowy5hk+gwNGKhNrq0euIB3dPTgn1iPibfcd9g=";
  };

  nativeCheckInputs = [
    pytest
  ];

  propagatedBuildInputs = [
    jsonschema
  ];

  pythonImportsCheck = [
    "validator_collection"
  ];

  meta = with lib; {
    description = "Python library of 60+ commonly-used validator functions";
    homepage = "https://github.com/insightindustry/validator-collection";
    license = licenses.mit;
    maintainers = with maintainers; [ zimbatm ];
  };
}
