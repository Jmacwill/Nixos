{ ... }:

{
  services.printers.enable = true;


  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}