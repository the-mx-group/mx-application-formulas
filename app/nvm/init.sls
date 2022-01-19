{% set user = salt['pillar.get']('users:primary-user') %}

{% if grains.os in ('Windows',) %}
  {% set userpath = salt['cmd.script']('salt://utils/files/GetUserHomeDir.ps1', shell='powershell', args=user) %}
  {% set userhome = userpath['stdout'] %}
{% else %}
  {% set userinfo = salt['user.info'](user) %}
    {% if home in userinfo %}
      {% set userhome = userinfo['home'] %}
    {% endif %}
{% endif %}

{% from "app/nvm/map.jinja" import nvm with context %}

{{ nvm.package }}:
  {{ nvm.installer }}

{%- if userhome is defined %}
Add nvm to primary user bash_profile:
  file.append:
    - text: {{ nvm.startup }}
    - name: {{ userhome }}/.mx_profile

Create npmrc:
  file.managed:
    - name: {{ userhome }}/.npmrc
    - user: {{ user }}
    - replace: False

Force NPM save exact mode so that dependencies are not saved with semver ranges:
  file.blockreplace:
    - name: {{ userhome }}/.npmrc
    - marker_start: "# START Mx semver config -DO-NOT-EDIT-"
    - marker_end: "# END Mx semver config"
    - prepend_if_not_found: True
    - append_newline: True
    - content: save-exact=true
{%- endif %}
