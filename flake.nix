{
  description = "Hello Nix Flakes";

  outputs = { self, nixpkgs }: {
    dependencies =
      with import nixpkgs { system = "x86_64-linux"; }; [ tinycc ];

    # called from 'nix build'
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "hello-nix-flakes";
        src = self;
        buildInputs = self.dependencies;
        buildPhase = "tcc -o hello-nix-flakes ./hello-nix-flakes.c";
        installPhase = "mkdir -p $out/bin; cp hello-nix-flakes $out/bin";
      };

    # called from 'nix develop'
    devShell.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      mkShell {
        buildInputs = self.dependencies;
      };
  };
}
