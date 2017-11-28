Install printing utilities:
  pkg.installed:
    - pkgs:
      - cups
      - cups-pdf
      - cups-filters

Enable the printing service:
  service.enabled:
    - name: org.cups.cupsd

Start the salt service:
  service.running:
    - name: org.cups.cupsd
