{ pkgs ? import <nixpkgs> { } }:
pkgs.runCommand "mkdocs"
{
  buildInputs = [
    pkgs.mkdocs
    pkgs.python3Packages.mkdocs-material
  ];
} ''
  mkdir -p $out/bin
  cat <<MKDOCS > $out/bin/mkdocs
  #!${pkgs.bash}/bin/bash
  set -euo pipefail
  export PYTHONPATH=$PYTHONPATH
  export MKDOCS_NUMTIDE_THEME=${./.}/base.yml
  exec ${pkgs.mkdocs}/bin/mkdocs "\$@"
  MKDOCS
  chmod +x $out/bin/mkdocs
''
