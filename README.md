# Hello Nix Flakes

A minimal Nix Flake to build a trivial C program. Uses the
[Tiny C Compiler](https://bellard.org/tcc) to demonstrate dependency management.

## Install Nix

Run installer from [download site](https://nixos.org/download.html).
```
$ curl -L https://nixos.org/nix/install | sh
```

## Enable Flakes

Install the unstable version of Nix.
```
$ nix-env -iA nixpkgs.nixUnstable
```

Add experimental features flags to `~/.config/nix/nix.conf`.
```
experimental-features = nix-command flakes ca-references
```

## Build Flake

```
$ nix build
$ ./result/bin/hello-nix-flakes
Hello Nix Flakes
```

## Enter Dev Shell

```
$ nix develop
$ tcc hello-nix-flakes.c
$ ./a.out
Hello Nix Flakes
```

## Install Flake

```
$ nix profile install .
$ which hello-nix-flakes
~/.nix-profile/bin/hello-nix-flakes
```
