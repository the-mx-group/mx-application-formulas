{% set user = salt['pillar.get']('users:primary-user') %}
{% set userInfo = salt['user.info'](user) %}
{% from tpldir ~ "/map.jinja" import java with context %}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ java.package }}:
  {{ java.installer }}

{% if 'home' in userInfo %}
Add Java17 home to primary user mx profile:
  file.append:
    - text: |
        export JAVA_HOME={{java.home}}
    - name: {{ userInfo.home }}/.mx_profile
{% endif %}
