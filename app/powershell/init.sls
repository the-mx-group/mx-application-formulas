include:
  - app/magic-sudo
  - app/magic-unsudo

homebrew/cask/powershell:
  pkg.installed:
    - require:
      - sls: app/magic-sudo
