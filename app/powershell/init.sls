{% from "app/powershell/map.jinja" import powershell with context %}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ powershell.package }}:
  {{ powershell.installer }}
