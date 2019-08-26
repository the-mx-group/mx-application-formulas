{% set user = salt['pillar.get']('users:primary-user') %}
{% set userinfo = salt['user.info'](user) %}
{% from "app/nvm/map.jinja" import nvm with context %}

{{ nvm.package }}:
  {{ nvm.installer }}

Add nvm to primary user bash_profile:
  file.append:
    - text: {{ nvm.startup }}
    - name: {{ userinfo.home }}/.mx_profile

Force NPM save exact mode so that dependencies are not saved with semver ranges:
  file.blockreplace:
    - name: {{ userinfo.home }}/.npmrc
    - marker_start: "# START Mx semver config -DO-NOT-EDIT-"
    - marker_end: "# END Mx semver config"
    - prepend_if_not_found: True
    - append_newline: True
    - content: save-exact=true



