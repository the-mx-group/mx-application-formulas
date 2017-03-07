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
    - name: echo y | android update sdk --no-ui --filter 'platform-tools'
    - unless: ls /usr/local/opt/android-sdk/platform-tools

Add android build tools:
  cmd.run:
    - name: echo y | android update sdk --no-ui --filter $(android list sdk --all --extended | grep -m1 -o -e "build-tools-\d*.\d*.\d*")
    - unless: ls /usr/local/opt/android-sdk/build-tools

Add API 21:
  cmd.run:
    - name: echo y | android update sdk --no-ui --filter 'android-21'
    - unless: ls /usr/local/opt/android-sdk/platforms/android-21
