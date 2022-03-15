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
  file.managed:
    - name: /etc/apt/sources.list.d/microsoft-prod.list
    - contents: deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/{{os}}/{{osrelease}}/prod {{ oscodename }} main
    - user: root
    - group: root
    - mode: 0644
    - require_in:
      - pkg: {{ powershell.package }}
    - require:
      - cmd: powershell-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: powershell-repo

powershell-repo-key:
  cmd.run:
    - name: wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft.gpg && chmod 0644 /usr/share/keyrings/microsoft.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /usr/share/keyrings/microsoft.gpg | grep EB3E94ADBE1229CF
{%- endif %}
