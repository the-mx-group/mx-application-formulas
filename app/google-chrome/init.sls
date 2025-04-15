{% from "app/google-chrome/map.jinja" import chrome with context %}

{{ chrome.package }}:
  {{ chrome.installer }}

{%- if grains['os_family'] in ('Debian',) %}
google-chrome-repo:
  file.managed:
    - name: /etc/apt/sources.list.d/google-chrome.list
    - contents: deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] https://dl.google.com/linux/chrome/deb/ {{ chrome.channel }} main
    - user: root
    - group: root
    - mode: 0644
    - require_in:
      - pkg: {{ chrome.package }}
    - require:
      - cmd: google-chrome-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: google-chrome-repo

google-chrome-repo-key:
  cmd.run:
    - name: wget -qO- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google-chrome.gpg && chmod 0644 /usr/share/keyrings/google-chrome.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /usr/share/keyrings/google-chrome.gpg | grep 32EE5355A6BC6E42
{%- endif %}
