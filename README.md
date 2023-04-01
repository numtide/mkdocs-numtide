# mkdocs-numtide

Our own mkdocs template, based on the material design

## Demo

To see the docs go 
<a href="https://numtide.github.io/mkdocs-numtide/" target="_blank">here.</a>

## Usage

The high-level is:

1. Import the flake
2. Use the default package as a mkdocs server in your devshell
3. Use `INHERIT: !ENV MKDOCS_NUMTIDE_THEME` in the mkdocs.yml
4. Call `mkdocs-numtide.lib.${system}.mkDocs { name, src }` to build the docs.
5. Copy the `./.github/workflows/gh-pages.yml` to the repo to publish the
   docs to github pages.
6. Configure the repo to publish the `gh-pages` branch to GitHub pages.

