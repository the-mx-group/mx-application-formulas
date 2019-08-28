{% from "app/vagrant/map.jinja" import vagrant with context %}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ vagrant.package }}:
  {{ vagrant.installer }}

#Only do the mac-specific stuff if it's a mac
{% if grains.os in ('MacOS',) %}

{% set user = salt['pillar.get']('users:primary-user') %}

Ensure the user owns his vagrant home:
  file.directory:
    - name: /Users/{{ user}}/.vagrant.d
    - user: {{ user }}
    - recurse:
      - user
{% endif %}

