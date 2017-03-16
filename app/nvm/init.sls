{% set user = salt['pillar.get']('users:primary-user') %}

nvm:
  pkg.installed

Add nvm to primary user profile:
  file:
    - exists:
      - name: /Users/{{ user }}/.bash_profile
      - user: {{ user }}
    - append:
      - text: source $(brew --prefix nvm)/nvm.sh
      - name: /Users/{{ user }}/.bash_profile
      - user: {{ user }}
