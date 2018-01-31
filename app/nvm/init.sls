{% set user = salt['pillar.get']('users:primary-user') %}
{% set userinfo = salt['user.info'](user) %}
{% from "app/nvm/map.jinja" import nvm with context %}

{{ nvm.package }}:
  {{ nvm.installer }}

Add nvm to primary user bash_profile:
  file.append:
    - text: {{ nvm.startup }}
    - name: {{ userinfo.home }}/.mx_profile
