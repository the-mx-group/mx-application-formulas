{% from "app/appimagelauncher/map.jinja" import appimagelauncher with context %}
{% set oscodename = salt['grains.get']('oscodename') %}

{{ appimagelauncher.package }}:
  {{ appimagelauncher.installer }}

{%- if grains['os_family'] in ('Debian',) %}
appimagelauncher-ppa-repo:
  file.managed:
    - name: /etc/apt/sources.list.d/appimagelauncher-team-ubuntu-stable.list
    - contents: |
        deb [signed-by=/etc/apt/keyrings/appimagelauncher-team-ubuntu-stable-keyring.gpg] https://ppa.launchpadcontent.net/appimagelauncher-team/stable/ubuntu {{ oscodename }} main
    - user: root
    - group: root
    - mode: '0644'
    - require_in:
      - pkg: {{ appimagelauncher.package }}
    - require:
      - cmd: appimagelauncher-ppa-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: appimagelauncher-ppa-repo

appimagelauncher-ppa-repo-key:
  cmd.run:
    - name: export GNUPGHOME=$(mktemp -d); gpg --keyserver keyserver.ubuntu.com --recv-keys ACD802F535B6F55D365285574AF9B16F75EF2FCA && gpg --export ACD802F535B6F55D365285574AF9B16F75EF2FCA > /etc/apt/keyrings/appimagelauncher-team-ubuntu-stable-keyring.gpg && chmod 644 /etc/apt/keyrings/appimagelauncher-team-ubuntu-stable-keyring.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /etc/apt/keyrings/appimagelauncher-team-ubuntu-stable-keyring.gpg | grep ACD802F535B6F55D365285574AF9B16F75EF2FCA
{%- endif %}
