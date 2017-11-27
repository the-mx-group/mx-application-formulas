{% set user = salt['pillar.get']('users:primary-user') %}
{% set home = salt['user.get](user) %}
{% from "app/nvm/map.jinja" import nvm with context %}

{{ nvm.package }}:
  {{ nvm.installer }}

Ensure primary user bash_profile exists:
  file.managed:
    - name: {{ home }}/.bash_profile
    - user: {{ user }}
    - replace: false

Add nvm to primary user bash_profile:
  file.append:
    - text: {{ nvm.startup }}
    - name: {{ home }}/.bash_profile
