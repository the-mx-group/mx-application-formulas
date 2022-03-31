{% set user = salt['pillar.get']('users:primary-user') %}

docker:
  pkg.installed

docker-compose:
  pkg.installed

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
