{ pkgs, ... }:
{
  # Enable Bluetooth support
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
    bluez-alsa
  ];
}
