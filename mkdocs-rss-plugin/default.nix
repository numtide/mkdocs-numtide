{ buildPythonPackage
, fetchFromGitHub
, isPy3k
, lib
, GitPython
, feedparser
, git
, jinja2
, mkdocs
, mkdocs-minify
, pymdown-extensions
, pytz
, pytest
, pyyaml
, validator-collection
}:

buildPythonPackage rec {
  pname = "mkdocs-rss-plugin";
  version = "1.7.0";

  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "Guts";
    repo = pname;
    rev = version;
    hash = "sha256-yQR2Lqq3qbXUM1/ZXkBDPF1yV2wCE/BHv4Qhod4dD+M=";
    leaveDotGit = true;
  };

  nativeCheckInputs = [
    pytest
  ];

  propagatedBuildInputs = [
    GitPython
    feedparser
    git
    jinja2
    mkdocs
    mkdocs-minify
    pymdown-extensions
    pyyaml
    pytz
    validator-collection
  ];

  pythonImportsCheck = [ "mkdocs_rss_plugin" ];

  doCheck = false;
  # This doesn't work
  # disabledTests = [
  #   "test_plugin_config_through_mkdocs"
  #   "test_remote_image_ok"
  # ];

  meta = with lib; {
    description = "MkDocs plugin to generate a RSS feeds for created and updated pages, using git log and YAML frontmatter (page.meta).";
    homepage = "https://github.com/Guts/mkdocs-rss-plugin/";
    license = licenses.mit;
    maintainers = with maintainers; [ zimbatm ];
  };
}
