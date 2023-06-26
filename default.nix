{ pkgs ? import <nixpkgs> { } }:
let
  mkdocs-markdownextradata-plugin = pkgs.python3Packages.callPackage ./mkdocs-markdownextradata-plugin { };
in
pkgs.runCommand "mkdocs"
{
  buildInputs = [
    pkgs.mkdocs
    pkgs.python3Packages.cairosvg
    pkgs.python3Packages.mkdocs-material
    pkgs.python3Packages.mkdocs-redirects
    pkgs.python3Packages.pillow
    mkdocs-markdownextradata-plugin
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
