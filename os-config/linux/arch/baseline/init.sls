Install OS baseline:
  pkg.installed:
    - pkgs:
      - base
      - base-devel
      - salt
      - networkmanager
      - linux-headers
