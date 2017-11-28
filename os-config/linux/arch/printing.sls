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

{% set user = salt['pillar.get']('users:primary-user') %}
Ensure primary user is in lp group:
  group.present:
    - name: lp
    - addusers:
      - {{ user }}
