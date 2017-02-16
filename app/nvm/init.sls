{% set user = salt['pillar.get']('users:primary-user') %}

nvm:
  pkg.installed

Add nvm to primary user profile:
  file.append:
    - text: source $(brew --prefix nvm)/nvm.sh
    - name: /Users/{{ user }}/.bash_profile
