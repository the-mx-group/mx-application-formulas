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

Add android platform tools:
  cmd.run:
    - name: android update sdk --no-ui --filter 'platform-tools'
    - unless: adb --version | grep -v "do not have"

Add android build tools:
  cmd.run:
    - name: android update sdk --no-ui --filter 'build-tools'
    - unless: dx --version | grep -v "do not have"
