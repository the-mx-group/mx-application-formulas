{% set user = salt['pillar.get']('users:primary-user') %}

include:
  - app/java

android-sdk:
  pkg.installed

Add sdk to primary user bash profile:
  file.append:
    - text: |
        export PATH="$PATH:/usr/local/opt/android-sdk"
    - name: /Users/{{ user }}/.bash_profile
