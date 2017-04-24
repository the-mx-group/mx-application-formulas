include:
  - app/magic-sudo
  - app/magic-unsudo

Caskroom/cask/powershell:
  pkg.installed:
    - require:
      - sls: app/magic-sudo
