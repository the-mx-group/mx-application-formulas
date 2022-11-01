{% set user = salt['pillar.get']('users:primary-user') %}
{% set userinfo = salt['user.info'](user) %}

{% if grains.os not in ('Windows') %} #skip this file if we're on windows

{%- if 'home' in userinfo %}
Create MX profile container for things Mx wants to add to user profiles:
  file.managed:
    - name: {{ userinfo.home }}/.mx_profile
    - user: root
    - mode: 0755
    - replace: false

  {% set rcfile = '.bashrc' %}
  {% if grains.os in ('MacOS',) %}
    {% set rcfile = '.bash_profile' %}
  {% endif %}
Ensure user profile exists:
  file.managed:
    - name: {{ userinfo.home }}/{{ rcfile }}
    - user: {{ user }}
    - mode: 600
    - replace: False

Ensure user is running the mx profile content:
  file.append:
    - name: {{ userinfo.home }}/{{ rcfile }}
    - text:
      - source ~/.mx_profile
      {%- if grains.os in ('MacOS',) %}
      - source ~/.profile
      {% endif -%}

  {% endif %} #skip this file if we're on windows
{%- endif %}
