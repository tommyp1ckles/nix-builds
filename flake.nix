{
  description = "Minimal NixOS VM flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }: {
    nixosConfigurations.nixosVM = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./vm.nix
        "${nixpkgs}/nixos/modules/virtualisation/qemu-vm.nix"
      ];
      specialArgs = {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      };
    };

    packages.x86_64-linux.nixosVM =
      self.nixosConfigurations.nixosVM.config.system.build.vm;
  };
}

