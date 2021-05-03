{
  description = "Hello Nix Flakes";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "hello-nix-flakes";
        src = self;
        buildInputs = [ tinycc ];
        buildPhase = "tcc -o hello-nix-flakes ./hello-nix-flakes.c";
        installPhase = "mkdir -p $out/bin; cp hello-nix-flakes $out/bin";
      };
  };
}
