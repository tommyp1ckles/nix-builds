build:
	nix build .#nixosVM --extra-experimental-features nix-command --extra-experimental-features flakes
