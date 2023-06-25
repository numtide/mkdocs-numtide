{ buildPythonPackage
, fetchFromGitHub
, isPy3k
, lib
, click
, mkdocs
, pytest
, pyyaml
}:

buildPythonPackage rec {
  pname = "mkdocs-markdownextradata-plugin";
  version = "0.2.5";

  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "rosscdh";
    repo = "mkdocs-markdownextradata-plugin";
    rev = version;
    hash = "sha256-b0y65zEKG3hkv4dsQbWG0Ra+k9Jyycus8/+emjQyaKg=";
  };

  nativeCheckInputs = [
    click
    pytest
  ];

  propagatedBuildInputs = [
    mkdocs
    pyyaml
  ];

  pythonImportsCheck = [ "markdownextradata" ];

  meta = with lib; {
    description = "A MkDocs plugin that injects the mkdocs.yml extra variables into the markdown template";
    homepage = "https://github.com/rosscdh/mkdocs-markdownextradata-plugin/";
    license = licenses.mit;
    maintainers = with maintainers; [ zimbatm ];
  };
}
