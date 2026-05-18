{
  description = "Jaanai's Blog — AstroPaper static site";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.stdenv.mkDerivation {
            name = "jaanai-blog";
            src = self;

            nativeBuildInputs = [ pkgs.nodejs_22 pkgs.pnpm pkgs.pnpmConfigHook ];

            pnpmDeps = pkgs.fetchPnpmDeps {
              pname = "jaanai-blog";
              version = "1.0.0";
              src = self;
              fetcherVersion = 3;
              hash = "sha256-ZwChr9RUD4o9i/33gSXXwelnBSWssjPDKjj1PHIcn4w=";
            };

            buildPhase = ''
              pnpm run build
            '';

            installPhase = ''
              cp -r dist $out
            '';
          };
        });
    };
}
