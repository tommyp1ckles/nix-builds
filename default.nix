with import <nixpkgs> {};

mkShell {
  pname = "trinitite";
  # TODO: Use my nvim config in this directly?
  buildInputs = [
    ripgrep
    tree-sitter
    lua
    python3
    nodejs
    bash
    gcc
    neovim
    kubectl
    kubernetes-helm
    go
    #clang_18
    nil
  ];
  shellHook = ''
  echo "☢️Trinitite Test Environment"
  export XDG_CONFIG_HOME=$PWD/config
  '';
}
