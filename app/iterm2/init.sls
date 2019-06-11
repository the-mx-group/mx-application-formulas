{% if grains.os in ('MacOS',) %}

{% set user = salt['pillar.get']('users:primary-user') %}

caskroom/cask/iterm2:
  pkg.installed

Close iterm2 when all windows are closed:
  macdefaults.write:
    - name: QuitWhenAllWindowsClosed
    - value: 1
    - domain: "com.googlecode.iterm2"
    - user: {{ user }}

{% endif %}
