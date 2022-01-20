{% from "app/google-chrome/map.jinja" import chrome with context %}

{{ chrome.package }}:
  {{ chrome.installer }}

{%- if grains['os_family'] in ('Debian',) %}
google-chrome-repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ {{ chrome.channel }} main
    - dist: {{ chrome.channel }}
    - file: /etc/apt/sources.list.d/google-chrome.list
    - require_in:
      - pkg: {{ chrome.package }}-{{ chrome.channel }}
    - key_url: https://dl.google.com/linux/linux_signing_key.pub
{%- endif %}
