{% from "app/mysql-workbench/map.jinja" import mysqlworkbench with context %}
{% set oscodename = salt['grains.get']('oscodename') %}
{% set os = salt['grains.get']('os')|lower %}
{% set osrelease =  salt['grains.get']('osrelease')%}

{{ mysqlworkbench.package }}:
  {{ mysqlworkbench.installer }}


{%- if grains['os'] in ('Ubuntu',) %}
mysqlworkbench-repo:
  file.managed:
    - name: /etc/apt/sources.list.d/mysql.list
    - contents: |
        deb [signed-by=/usr/share/keyrings/mysql.gpg] http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-apt-config
        deb [signed-by=/usr/share/keyrings/mysql.gpg] http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-8.0
        deb [signed-by=/usr/share/keyrings/mysql.gpg] http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-tools
        #deb [signed-by=/usr/share/keyrings/mysql.gpg] http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-tools-preview
        deb-src [signed-by=/usr/share/keyrings/mysql.gpg] http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-8.0
    - user: root
    - group: root
    - mode: 0644
    - require_in:
      - pkg: {{ mysqlworkbench.package }}
    - require:
      - cmd: mysqlworkbench-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: mysqlworkbench-repo

mysqlworkbench-repo-key:
  cmd.run:
    - name: export GNUPGHOME=$(mktemp -d); gpg --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C && gpg --export B7B3B788A8D3785C > /usr/share/keyrings/mysql.gpg && chmod 644 /usr/share/keyrings/mysql.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /usr/share/keyrings/mysql.gpg | grep B7B3B788A8D3785C
{%- endif %}
