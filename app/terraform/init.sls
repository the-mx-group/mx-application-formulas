{% from "app/terraform/map.jinja" import terraform with context %}
{% set oscodename = salt['grains.get']('oscodename') %}

{{ terraform.package }}:
  {{ terraform.installer }}

{%- if grains['os_family'] in ('Debian',) %}
hashicorp-repo:
  file.managed:
    - name: /etc/apt/sources.list.d/hashicorp-{{ oscodename }}.list
    - contents: |
        deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com {{ oscodename }} main
        # deb-src [arch=amd64 signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com {{ oscodename }} main
    - user: root
    - group: root
    - mode: "0644"
    - require_in:
      - pkg: {{ terraform.package }}
    - require:
      - cmd: hashicorp-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: hashicorp-repo

hashicorp-repo-key:
  cmd.run:
    - name: wget -qO- https://apt.releases.hashicorp.com/gpg | gpg --dearmor > /usr/share/keyrings/hashicorp.gpg && chmod 0644 /usr/share/keyrings/hashicorp.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /usr/share/keyrings/hashicorp.gpg | grep 798AEC654E5C15428C8E42EEAA16FCBCA621E701
{%- endif %}
