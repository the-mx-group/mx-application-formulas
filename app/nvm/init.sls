{% set user = salt['pillar.get']('users:primary-user') %}

nvm:
  pkg.installed

Ensure primary user bash_profile exists:
  file.exists:
    - name: /Users/{{ user }}/.bash_profile
    - user: {{ user }}

Add nvm to primary user bash_profile:
  file.append:
    - text: source $(brew --prefix nvm)/nvm.sh
    - name: /Users/{{ user }}/.bash_profile
    - user: {{ user }}
