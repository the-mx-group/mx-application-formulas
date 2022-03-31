{% from "app/docker/map.jinja" import docker with context %}
{% set user = salt['pillar.get']('users:primary-user') %}

{{ docker.installer }}

#Don't need docker-machine etc on linux
{% if grains.kernel in ('Linux',) %}

# This is configuration for Linux docker-native platforms

Ensure primary user is in docker group:
  group.present:
    - name: docker
    - addusers:
      - {{ user }}

Ensure docker service is enabled:
  service.enabled:
    - name: docker

{% endif %}
