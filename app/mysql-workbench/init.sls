{% from "app/mysql-workbench/map.jinja" import mysqlworkbench with context %}
{% set oscodename = salt['grains.get']('oscodename') %}
{% set os = salt['grains.get']('os')|lower %}
{% set osrelease =  salt['grains.get']('osrelease')%}

{{ mysqlworkbench.package }}:
  {{ mysqlworkbench.installer }}


{%- if grains['os_family'] in ('Debian',) %}
mysqlworkbench-repo:
  pkgrepo.managed:
    - name: |
        deb http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-apt-config
        deb http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-8.0
        deb http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-tools
        #deb http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-tools-preview
        deb-src http://repo.mysql.com/apt/{{ os }}/ {{ oscodename }} mysql-8.0
    - dist: {{ oscodename }}
    - file: /etc/apt/sources.list.d/mysql.list
    - require_in:
      - pkg: {{ mysqlworkbench.package }}
    - keyserver: pgp.mit.edu
    - keyid: 3A79BD29
{%- endif %}
