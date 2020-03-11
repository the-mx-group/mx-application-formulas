{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/vscode/map.jinja" import vscode with context %}

{{ vscode.package }}:
  {{ vscode.installer }}


{% if grains.os not in ('Windows') %} #don't install extensions on windows since we'd need the user pw

Install editorconfig extension:
  cmd.run:
    - name: {{ vscode.binary }} --install-extension EditorConfig.EditorConfig
    - runas: {{ user }}
    - unless: {{ vscode.binary }} --list-extensions | grep EditorConfig.EditorConfig

Install GitLens extension:
  cmd.run:
    - name: {{ vscode.binary }} --install-extension eamodio.gitlens
    - runas: {{ user }}
    - unless: {{ vscode.binary }} --list-extensions | grep eamodio.gitlens

{% endif %}
