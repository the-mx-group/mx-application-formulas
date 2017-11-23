{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/fastlane/map.jinja" import fastlane with context %}

{{ fastlane.package }}:
  {{ fastlane.installer }}

Ensure local fastlane is owned by the right user:
  file.directory:
    - name: {{ fastlane.home }}
    - user: {{ user }}
    - dir_mode: 0755
    - recurse:
      - user

{% if grains.os in ('MacOS',) %}
Ensure fastlane is installed and PATHed:
  cmd.run:
    - runas: {{ user }}
    - name: echo y | /usr/local/Caskroom/fastlane/1.7/install -u -b
    - unless: echo $PATH | grep fastlane
{% endif %}
