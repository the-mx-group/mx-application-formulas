{% set user = salt['pillar.get']('users:primary-user') %}

Comment out the nopasswd sudo:
  file.comment:
    - name: /etc/sudoers
    - regex: {{ user }}.* # CASK_INSTALLER
    - backup: False
    - order: last
