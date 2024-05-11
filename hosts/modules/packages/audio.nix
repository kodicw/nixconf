{ config, pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  environment.systemPackages = with pkgs; [
    pavucontrol
    pulsemixer # A CLI mixer for PulseAudio
  ];
  hardware.pulseaudio.enable = false;
}
