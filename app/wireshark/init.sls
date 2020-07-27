{% from "app/wireshark/map.jinja" import wireshark with context %}

{{ wireshark.package }}:
  {{ wireshark.installer }}


{% if grains.os in ('Linux','Arch') %}
{% set user = salt['pillar.get']('users:primary-user') %}

Ensure primary user is in wireshark group:
  group.present:
    - name: wireshark
    - addusers:
      - {{ user }}

{% endif %}
