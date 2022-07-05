{% set user = salt['pillar.get']('users:primary-user') %}

node@10:
  pkg.installed

Ensure primary user bash_profile exists:
  file.managed:
    - name: /Users/{{ user }}/.mx_profile
    - user: {{ user }}
    - replace: false

Add node10 to primary user bash_profile:
  file.append:
    - text: export PATH="/usr/local/opt/node@10/bin:$PATH"
    - name: /Users/{{ user }}/.mx_profile
