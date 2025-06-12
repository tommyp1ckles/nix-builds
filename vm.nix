{ config, pkgs, ... }:

{
  networking.hostName = "nixvm";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

  fileSystems."/" = {
    device = "/dev/vda";
    fsType = "ext4";
  };

  services.openssh.enable = true;

  users.users.root = {
    password = "root";
  };

  environment.systemPackages = with pkgs; [
    vim git curl htop neovim 
  ];

  system.stateVersion = "24.05";
}

