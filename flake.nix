{
  description = "Hello Nix Flakes";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      buildInputs = [ pkgs.tinycc ];
    in
      {
        # called from 'nix build'
        defaultPackage.x86_64-linux =
          pkgs.stdenv.mkDerivation {
            name = "hello-nix-flakes";
            src = self;
            inherit buildInputs;
            buildPhase = "tcc -o hello-nix-flakes ./hello-nix-flakes.c";
            installPhase = "mkdir -p $out/bin; cp hello-nix-flakes $out/bin";
          };

        # called from 'nix develop'
        devShell.x86_64-linux =
          pkgs.mkShell {
            inherit buildInputs;
          };
      };
}
