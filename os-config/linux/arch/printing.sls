Install printing utilities:
  pkg.installed:
    - pkgs:
      - cups
      - cups-pdf
      - cups-filters
      - foomatic-db-engine
      - foomatic-db
      - foomatic-db-ppds
      - foomatic-db-nonfree-ppds
      - avahi

Enable the printing service:
  service.enabled:
    - name: org.cups.cupsd

Start the printing service:
  service.running:
    - name: org.cups.cupsd

Enable the printer discovery service:
  service.enabled:
    - name: avahi-daemon

Start the printer discovery service:
  service.running:
    - name: avahi-daemon

{% set user = salt['pillar.get']('users:primary-user') %}
Ensure primary user is in lp group:
  group.present:
    - name: lp
    - addusers:
      - {{ user }}
