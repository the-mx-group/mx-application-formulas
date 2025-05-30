{% set oscodename = salt['pillar.get']('overrideoscodename', salt['grains.get']('oscodename')) %}
{% set osarch = salt['grains.get']('osarch') %}
{% set os = salt['grains.get']('os')|lower %}

{%- if grains['os_family'] in ('Debian',) %}

Add HashiCorp repo:
  pkgrepo.managed:
    - name: 'deb [arch={{ osarch }} signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com {{ oscodename }} main'
    - file: '/etc/apt/sources.list.d/hashicorp.list'
    - key_url: 'https://apt.releases.hashicorp.com/gpg'
    - aptkey: False
    - clean_file: True

{%- endif %}

{%- if grains['os_family'] in ('RedHat',) %}
  {%- if os == "fedora" %}
    {%- set reporelease = "fedora" %}
  {%- elif os == "amazon" %}
    {%- set reporelease = "AmazonLinux" %}
  {%- else %}
    {%- set reporelease = "RHEL" %}
  {%- endif %}
Add HashiCorp repo:
  pkgrepo.managed:
    - name: hashicorp
    - baseurl: https://rpm.releases.hashicorp.com/{{ reporelease }}/hashicorp.repo
    - gpgcheck: 1
    - gpgkey: 'https://rpm.releases.hashicorp.com/gpg'

{%- endif %}
