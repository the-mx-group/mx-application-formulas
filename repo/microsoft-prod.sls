{% set oscodename = salt['grains.get']('oscodename') %}
{% set os = salt['grains.get']('os')|lower %}
{% set osrelease =  salt['grains.get']('osrelease')%}

{%- if grains['os_family'] in ('Debian',) %}

Add Microsoft prod repo:
  pkgrepo.managed:
    - name: 'deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/{{os}}/{{osrelease}}/prod {{ oscodename }} main'
    - file: '/etc/apt/sources.list.d/microsoft-prod.list'
    - key_url: 'https://packages.microsoft.com/keys/microsoft.asc'
    - aptkey: False

{%- endif %}
