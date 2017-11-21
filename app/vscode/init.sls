{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/vscode/map.jinja" import vscode with context %}

{{ vscode.package }}:
  {{ vscode.installer }}

Install editorconfig extension:
  cmd.run:
    - name: /usr/local/bin/code --install-extension EditorConfig.EditorConfig
    - runas: {{ user }}
    - unless: /usr/local/bin/code --list-extensions | grep EditorConfig.EditorConfig
