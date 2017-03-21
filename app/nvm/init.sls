{% set user = salt['pillar.get']('users:primary-user') %}

nvm:
  pkg.installed

Ensure primary user bash_profile exists:
  file.managed:
    - name: /Users/{{ user }}/.bash_profile
    - user: {{ user }}
    - replace: false

Add nvm to primary user bash_profile:
  file.append:
    - text: |

        # NVM
        export NVM_DIR=~/.nvm
        source $(brew --prefix nvm)/nvm.sh
    - name: /Users/{{ user }}/.bash_profile
