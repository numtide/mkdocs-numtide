{ pkgs ? import <nixpkgs> { } }:
let
  mkdocs-markdownextradata-plugin = pkgs.python3Packages.callPackage ./mkdocs-markdownextradata-plugin { };
  mkdocs-rss-plugin = pkgs.python3Packages.callPackage ./mkdocs-rss-plugin {
    inherit validator-collection;
  };
  validator-collection = pkgs.python3Packages.callPackage ./validator-collection { };
in
pkgs.runCommand "mkdocs"
{
  buildInputs = [
    mkdocs-markdownextradata-plugin
    mkdocs-rss-plugin
    pkgs.mkdocs
    pkgs.python3Packages.mkdocs-material
    pkgs.python3Packages.mkdocs-redirects
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
