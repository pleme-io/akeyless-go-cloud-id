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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "library";
    pname = "akeyless-go-cloud-id";
    vendorHash = "sha256-vthsshYCPS7fBM0F9NkOMeKDDomK7SJu8P0niZex1jk=";
    description = "Go library to retrieve cloud identity for AWS, Azure, and GCP";
    homepage = "https://github.com/pleme-io/akeyless-go-cloud-id";
  };
}
