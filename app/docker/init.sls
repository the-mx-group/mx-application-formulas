{% from "app/docker/map.jinja" import docker with context %}
{% set user = salt['pillar.get']('users:primary-user') %}

{{ docker.package }}:
  {{ docker.installer }}

# Don't need docker-machine etc on linux
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

Ensure ip forwarding is on so containers can access network:
  file.managed:
    - name: /etc/sysctl.d/30-ipforward.conf
    - contents: |
        net.ipv4.ip_forward=1

{% endif %}
