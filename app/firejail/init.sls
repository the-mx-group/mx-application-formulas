{% from "app/firejail/map.jinja" import firejail with context %}
{% set oscodename = salt['grains.get']('oscodename') %}

{{ firejail.package }}:
  {{ firejail.installer }}

{%- if grains['os_family'] in ('Debian',) %}
firejail-ppa-repo:
  file.managed:
    - name: /etc/apt/sources.list.d/deki-firejail-ppa.list
    - contents: |
        deb [signed-by=/etc/apt/keyrings/deki-firejail-ppa-keyring.gpg] https://ppa.launchpadcontent.net/deki/firejail/ubuntu {{ oscodename }} main
    - user: root
    - group: root
    - mode: '0644'
    - require_in:
      - pkg: {{ firejail.package }}
    - require:
      - cmd: firejail-ppa-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: firejail-ppa-repo

firejail-ppa-repo-key:
  cmd.run:
    - name: export GNUPGHOME=$(mktemp -d); gpg --keyserver keyserver.ubuntu.com --recv-keys 0B58929C0081A52410E8992260537CDCF684460C && gpg --export 0B58929C0081A52410E8992260537CDCF684460C > /etc/apt/keyrings/deki-firejail-ppa-keyring.gpg && chmod 644 /etc/apt/keyrings/deki-firejail-ppa-keyring.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /etc/apt/keyrings/deki-firejail-ppa-keyring.gpg | grep 0B58929C0081A52410E8992260537CDCF684460C
{%- endif %}
