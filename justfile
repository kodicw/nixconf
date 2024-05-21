set shell := ["nu", "-c"]

rebuild-pre:
  git add *
  nixpkgs-fmt ./

rebuild: rebuild-pre
  scripts/system-flake-rebuild.nu

rebuild-catalyst: rebuild-pre
  nixos-rebuild --flake .#catalyst switch

build-vm HOSTNAME: rebuild-pre
  scripts/vm-flake-build.nu {{HOSTNAME}}

run-vm HOSTNAME: rebuild-pre
  just build-vm {{HOSTNAME}}
  result/bin/run-{{HOSTNAME}}-vm
  rm result
  rm {{HOSTNAME}}.qcow2

node: rebuild-pre
  colmena build
  colmena apply

send-it: rebuild-pre
  git commit -am "send it!🌋"
  git push
  
