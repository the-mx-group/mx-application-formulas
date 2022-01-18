{% set user = salt['pillar.get']('users:primary-user') %}
{% set installextensions = salt['pillar.get']('vscode:lookup:installextensions', default='True') %}
{% from "app/vscode/map.jinja" import vscode with context %}

{{ vscode.package }}:
  {{ vscode.installer }}

{% if installextensions == 'True' %}
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

Install SonarLint extension:
  cmd.run:
    - name: {{ vscode.binary }} --install-extension SonarSource.sonarlint-vscode
    - runas: {{ user }}
    - unless: {{ vscode.binary }} --list-extensions | grep -i SonarSource.sonarlint-vscode

Install tslint extension:
  cmd.run:
    - name: {{ vscode.binary }} --install-extension ms-vscode.vscode-typescript-tslint-plugin
    - runas: {{ user }}
    - unless: {{ vscode.binary }} --list-extensions | grep -i ms-vscode.vscode-typescript-tslint-plugin

Install Better Align extension:
  cmd.run:
    - name: {{ vscode.binary }} --install-extension wwm.better-align
    - runas: {{ user }}
    - unless: {{ vscode.binary }} --list-extensions | grep -i wwm.better-align


  {% endif %}
{% endif %}

{%- if grains['os_family'] in ('Debian',) %}
vscode-repo:
  pkgrepo.managed:
    - name: deb [arch=amd64,arm64,armhf] https://packages.microsoft.com/repos/code {{ vscode.channel }} main
    - dist: {{ vscode.channel }}
    - file: /etc/apt/sources.list.d/vscode.list
    - require_in:
      - pkg: {{ vscode.package }}
    - key_url: https://packages.microsoft.com/keys/microsoft.asc
{%- endif %}
