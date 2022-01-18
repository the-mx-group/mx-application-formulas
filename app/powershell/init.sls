{% from "app/powershell/map.jinja" import powershell with context %}
{% set oscodename = salt['grains.get']('oscodename') %}
{% set os = salt['grains.get']('os')|lower %}
{% set osrelease =  salt['grains.get']('osrelease')%}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ powershell.package }}:
  {{ powershell.installer }}

{%- if grains['os_family'] in ('Debian',) %}
powershell-repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://packages.microsoft.com/{{os}}/{{osrelease}}/prod {{ oscodename }} main
    - dist: {{ oscodename }}
    - file: /etc/apt/sources.list.d/microsoft-prod.list
    - require_in:
      - pkg: {{ powershell.package }}
    - key_url: https://packages.microsoft.com/keys/microsoft.asc
{%- endif %}
