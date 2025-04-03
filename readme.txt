jonathans nix profile



use this to install lsp for nix

This repo is also packaged via Nix flakes. The language server package is available in the default flake output
 github:oxalica/nil#, under bin/nil.

To install, run 

nix profile install github:oxalica/nil. 

Alternatively, you can use this repository as a flake input, and 
add its output to your own flake-managed system-wide and/or home configurations.


Printers are another special beast - in printers.nix, you may need to specify something other than the HP printers
that I have installed.

go here:

https://nixos.wiki/wiki/Printing

to get the latest package names to install