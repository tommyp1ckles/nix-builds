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

  # Enable the X11 server and Plasma desktop
  services.xserver.enable = true;
  # Choose a display manager (sddm is the default for Plasma)
  services.xserver.displayManager.sddm.enable = true;

  # Enable the full KDE Plasma desktop environment
  services.xserver.desktopManager.plasma5.enable = true;

  # Optional but recommended: enable sound (PulseAudio or PipeWire)
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    konsole
    dolphin
    plasma-browser-integration
  ];

  system.stateVersion = "24.05";

  virtualisation.memorySize = 4096;       # RAM in MB (default: 512)
  virtualisation.cores = 4;               # number of vCPUs
  virtualisation.graphics = true;         # enable graphical display
  virtualisation.qemu.options = [
    "-cpu host"                           # optional: emulate host CPU features
    "-smp 4"                              # override CPU count (optional)
    "-enable-kvm"                         # if supported
  ];
}

