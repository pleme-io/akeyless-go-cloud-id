{
  description = "Go library to retrieve cloud identity for AWS, Azure, and GCP";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoLibraryCheck = (import "${substrate}/lib/go-library-check.nix").mkGoLibraryCheck;
    in {
      checks.default = mkGoLibraryCheck pkgs {
        pname = "akeyless-go-cloud-id";
        version = "0.0.0-dev";
        src = self;
        vendorHash = "sha256-vthsshYCPS7fBM0F9NkOMeKDDomK7SJu8P0niZex1jk=";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
