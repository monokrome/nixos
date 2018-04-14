{config, pkgs, ...}:

{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/iso-image.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];

  boot.kernelParams = [ "console=ttyS0,115200n8" ];
}
