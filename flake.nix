{
  description = "mkdocs-numtide";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      eachSystem = f:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (system:
          f nixpkgs.legacyPackages.${system}
        );
    in
    {
      packages = eachSystem (pkgs: {
        default = import ./. { inherit pkgs; };

        docs = self.lib.${pkgs.stdenv.hostPlatform.system}.mkDocs {
          name = "mkdocs-numtide";
          src = ./.;
        };
      });

      lib = eachSystem (pkgs: {
        mkDocs =
          # Function that builds the docs for a repo.
          #
          # It assumes that we want to import the src/mkdocs.yml and all of
          # the src/docs folder.
          { name, src }:
          pkgs.stdenv.mkDerivation {
            inherit name;

            src = builtins.path {
              name = "src-${name}-docs";
              path = src + "/docs";
            };

            # Re-create the folder structure since mkdocs insists on having the
            # mkdocs.yml at the root of the repo.
            unpackPhase = ''
              cp -r --no-preserve=mode $src docs
              cp ${src + "/mkdocs.yml"} mkdocs.yml
            '';

            nativeBuildInputs = [
              self.packages.${pkgs.stdenv.hostPlatform.system}.default
            ];

            buildPhase = ''
              mkdocs build
            '';

            installPhase = ''
              mv site $out
            '';

            passthru.mkdocs = self.packages.${pkgs.stdenv.hostPlatform.system}.default;
          };
      });

      devShells = eachSystem (pkgs: {
        default = pkgs.mkShellNoCC {
          packages = [
            self.packages.${pkgs.stdenv.hostPlatform.system}.default
          ];
        };
      });
    };
}
