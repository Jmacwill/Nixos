jonathans nix profile



use this to install lsp for nix

This repo is also packaged via Nix flakes. The language server package is available in the default flake output
 github:oxalica/nil#, under bin/nil.

To install, run 

nix profile install github:oxalica/nil. 

Alternatively, you can use this repository as a flake input, and 
add its output to your own flake-managed system-wide and/or home configurations.
