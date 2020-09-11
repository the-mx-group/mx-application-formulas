{% set user = salt['pillar.get']('users:primary-user') %}
{% from tpldir ~ "/map.jinja" import config with context %}

{{ config.package }}:
  {{ config.installer }}

# also install docker-compose
{{ config.compose.package }}:
  {{ config.compose.installer }}


{% if grains.os in ('Linux','Arch','Debian') %}
# This is configuration for Linux docker-native platforms

Ensure primary user is in docker group:
  group.present:
    - name: docker
    - addusers:
      - {{ user }}

{% if user != None %}
Ensure docker service is enabled:
  service.enabled:
    - name: docker
{% endif %}

{% endif %}
