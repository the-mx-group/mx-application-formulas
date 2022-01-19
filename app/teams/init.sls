{% from "app/teams/map.jinja" import teams with context %}

{{ teams.package }}:
  {{ teams.installer }}

{%- if grains['os_family'] in ('Debian',) %}
teams-repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams {{ teams.channel }} main
    - dist: {{ teams.channel }}
    - file: /etc/apt/sources.list.d/teams.list
    - require_in:
      - pkg: {{ teams.package }}
    - key_url: https://packages.microsoft.com/keys/microsoft.asc
{%- endif %}
