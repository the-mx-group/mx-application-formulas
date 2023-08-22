{% from "app/powershell/map.jinja" import powershell with context %}
{% set oscodename = salt['grains.get']('oscodename') %}
{% set os = salt['grains.get']('os')|lower %}
{% set osrelease =  salt['grains.get']('osrelease')%}

include:
  - app/magic-sudo
  - app/magic-unsudo
  - repo/microsoft-prod

{{ powershell.package }}:
  {{ powershell.installer }}
