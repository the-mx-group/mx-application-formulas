{% set user = salt['pillar.get']('users:primary-user') %}

{% if grains.os in ('MacOS',) %}

Comment out the nopasswd sudo:
  file.comment:
    - name: /etc/sudoers
    - regex: {{ user }}.* # CASK_INSTALLER
    - backup: False
    - order: last

{% endif %}
