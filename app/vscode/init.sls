{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/vscode/map.jinja" import vscode with context %}

{{ vscode.package }}:
  {{ vscode.installer }}

Install editorconfig extension:
  cmd.run:
    - name: {{ vscode.binary }} --install-extension EditorConfig.EditorConfig
    - runas: {{ user }}
    - unless: {{ vscode.binary }} --list-extensions | grep EditorConfig.EditorConfig
