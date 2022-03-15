{% from "app/teams/map.jinja" import teams with context %}

{{ teams.package }}:
  {{ teams.installer }}

{%- if grains['os_family'] in ('Debian',) %}
teams-repo:
  file.managed:
    - name: /etc/apt/sources.list.d/teams.list
    - contents: deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/ms-teams {{ teams.channel }} main
    - user: root
    - group: root
    - mode: 0644
    - require_in:
      - pkg: {{ teams.package }}
    - require:
      - cmd: teams-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: teams-repo

teams-repo-key:
  cmd.run:
    - name: wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft.gpg && chmod 0644 /usr/share/keyrings/microsoft.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /usr/share/keyrings/microsoft.gpg | grep EB3E94ADBE1229CF
{%- endif %}
