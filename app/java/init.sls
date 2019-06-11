{% set user = salt['pillar.get']('users:primary-user') %}
{% set userInfo = salt['user.info'](user) %}
{% from "app/java/map.jinja" import java with context %}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ java.package }}:
  {{ java.installer }}


Add Java home to primary user mx profile:
  file.append:
    - text: |
        export JAVA_HOME={{java.home}}
    - name: {{ userInfo.home }}/.mx_profile
