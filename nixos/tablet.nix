{ pkgs, ... }:
{
  services.input-remapper = {
    enable = true;
    enableUdevRules = true;
  };
  # hardware.opentabletdriver = {
  #   enable = true;
  # };
  # hardware.uinput.enable = true;
  # boot.kernelModules = [ "uinput" ];
}
