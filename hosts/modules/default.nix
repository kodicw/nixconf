{ lib, ... }:
{
  imports = [
    ./users
    ./desktop
    ./boot
    ./servers
    ./network
    ./packages
    ./drivers
  ];
}
