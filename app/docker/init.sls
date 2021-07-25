{% set user = salt['pillar.get']('users:primary-user') %}
{% from tpldir ~ "/map.jinja" import config with context %}

{ config.installer }}

{% if grains.os in ('Linux','Arch','Debian') %}
# This is configuration for Linux docker-native platforms

{% if user != None %}
Ensure primary user is in docker group:
  group.present:
    - name: docker
    - addusers:
      - {{ user }}
{% endif %}

Ensure docker service is enabled:
  service.enabled:
    - name: docker

{% endif %}
