{% if grains.os in ('MacOS',) %}
{% set user = salt['pillar.get']('users:primary-user') %}

Ensure cask directory exists for primary user:
  file.directory:
    - name: /usr/local/caskroom
    - user: {{ user }}
    - group: admin
    - dir_mode: 775

cask:
  pkg.installed:
    - taps:
      - homebrew/cask
      - buo/cask-upgrade
{% endif %}
