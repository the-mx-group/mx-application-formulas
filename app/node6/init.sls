{% set user = salt['pillar.get']('users:primary-user') %}

node@6:
  pkg.installed

Ensure primary user bash_profile exists:
  file.managed:
    - name: /Users/{{ user }}/.bash_profile
    - user: {{ user }}
    - replace: false

Add nvm to primary user bash_profile:
  file.append:
    - text: export PATH="/usr/local/opt/node@6/bin:$PATH"
    - name: /Users/{{ user }}/.bash_profile
