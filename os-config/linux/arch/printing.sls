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
      - system-config-printer

Enable the printing service:
  service.enabled:
    - name: cups

Start the printing service:
  service.running:
    - name: cups

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
