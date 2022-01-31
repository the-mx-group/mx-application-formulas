{% from "app/azure-cli/map.jinja" import azurecli with context %}
{% set oscodename = salt['grains.get']('oscodename') %}

{{ azurecli.package }}:
  {{ azurecli.installer }}

{%- if grains['os_family'] in ('Debian',) %}
azurecli-repo:
  file.managed:
    - name: /etc/apt/sources.list.d/azure-cli.list
    - contents: deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli {{ oscodename }} main
    - user: root
    - group: root
    - mode: 0644
    - require_in:
      - pkg: {{ azurecli.package }}
    - require:
      - cmd: azurecli-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: azurecli-repo

azurecli-repo-key:
  cmd.run:
    - name: wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft.gpg && chmod 0644 /usr/share/keyrings/microsoft.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /usr/share/keyrings/microsoft.gpg | grep EB3E94ADBE1229CF
{%- endif %}
