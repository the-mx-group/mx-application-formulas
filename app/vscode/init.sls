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

Install eslint extension:
  cmd.run:
    - name: {{ vscode.binary }} --install-extension dbaeumer.vscode-eslint
    - runas: {{ user }}
    - unless: {{ vscode.binary }} --list-extensions | grep -i dbaeumer.vscode-eslint

Install Better Align extension:
  cmd.run:
    - name: {{ vscode.binary }} --install-extension chouzz.vscode-better-align
    - runas: {{ user }}
    - unless: {{ vscode.binary }} --list-extensions | grep -i chouzz.vscode-better-align


  {% endif %}
{% endif %}

{%- if grains['os_family'] in ('Debian',) %}
vscode-repo:
  file.managed:
    - name: /etc/apt/sources.list.d/vscode.list
    - contents: deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code {{ vscode.channel }} main
    - user: root
    - group: root
    - mode: 0644
    - require_in:
      - pkg: {{ vscode.package }}
    - require:
      - cmd: vscode-repo-key
  cmd.run:
    - name: apt-get update
    - onchanges:
      - file: vscode-repo

vscode-repo-key:
  cmd.run:
    - name: wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft.gpg && chmod 0644 /usr/share/keyrings/microsoft.gpg
    - unless: gpg -k --no-default-keyring --with-colons --keyring /usr/share/keyrings/microsoft.gpg | grep EB3E94ADBE1229CF
{%- endif %}
