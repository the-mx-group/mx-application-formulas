{% from "app/fsearch/map.jinja" import fsearch with context %}
{% set oscodename = salt['grains.get']('oscodename') %}

{{ fsearch.package }}:
  {{ fsearch.installer }}

{%- if grains['os_family'] in ('Debian',) %}
fsearch-ppa-repo:
  file.managed:
    - name: /etc/apt/sources.list.d/christian-boxdoerfer-fsearch-stable-ppa.list
    - contents: |
        deb [signed-by=/etc/apt/keyrings/christian-boxdoerfer-fsearch-stable-ppa-keyring.gpg] http://ppa.launchpadcontent.net/christian-boxdoerfer/fsearch-stable/ubuntu {{ oscodename }} main
    - user: root
    - group: root
    - mode: '0644'
    - require_in:
      - pkg: {{ fsearch.package }}
    - require:
      - cmd: fsearch-ppa-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: fsearch-ppa-repo

fsearch-ppa-repo-key:
  cmd.run:
    - name: export GNUPGHOME=$(mktemp -d); gpg --keyserver keyserver.ubuntu.com --recv-keys 75555AFF5215AD9DBFD8CDB952B2FFB2DC496F40 && gpg --export 75555AFF5215AD9DBFD8CDB952B2FFB2DC496F40 > /etc/apt/keyrings/christian-boxdoerfer-fsearch-stable-ppa-keyring.gpg && chmod 644 /etc/apt/keyrings/christian-boxdoerfer-fsearch-stable-ppa-keyring.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /etc/apt/keyrings/christian-boxdoerfer-fsearch-stable-ppa-keyring.gpg | grep 75555AFF5215AD9DBFD8CDB952B2FFB2DC496F40
{%- endif %}
