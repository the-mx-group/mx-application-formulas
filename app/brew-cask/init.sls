{% if grains.os in ('MacOS',) %}
{% set user = salt['pillar.get']('users:primary-user') %}

Ensure cask directory exists for primary user:
  file.directory:
    - name: /usr/local/Caskroom
    - user: {{ user }}
    - group: admin
    - dir_mode: 775

cask:
  pkg.installed:
    - taps:
      - caskroom/cask
      - buo/cask-upgrade
{% endif %}
