{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    wget
    vim
    htop
    unzip
    file
    pciutils
    usbutils
  ];

  services.openssh.enable = true;

  users.users.root = {
    password = "root";
  };

  # Common shell preferences (optional)
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}

