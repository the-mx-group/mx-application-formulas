include:
  - app/magic-sudo
  - app/magic-unsudo

caskroom/cask/powershell:
  pkg.installed:
    - require:
      - sls: app/magic-sudo
