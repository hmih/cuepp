let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
in

pkgs.mkShellNoCC {
  buildInputs = with pkgs; [
    # --pure
    git
    go
    cue
    less
    openssh
  ];

  shellHook = ''
    export CUE_EXPERIMENT=embed
    export CUE_REGISTRY=127.0.0.1:9876
  '';
}
