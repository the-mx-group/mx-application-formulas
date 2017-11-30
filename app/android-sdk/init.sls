{% set user = salt['pillar.get']('users:primary-user') %}

include:
  - app/java
  - .install.base





Add sdk to primary user bash profile:
  file.append:
    - text: |
        export PATH="$PATH:/usr/local/opt/android-sdk/bin"
    - name: /Users/{{ user }}/.bash_profile

Add android platform tools:
  cmd.run:
    - name: echo y | android update sdk --no-ui --filter 'platform-tools'
    - runas: {{ user }}
    - unless: ls /usr/local/opt/android-sdk/platform-tools

Add android build tools:
  cmd.run:
    - name: echo y | android update sdk --no-ui --filter $(android list sdk --all --extended | grep -m1 -o -e "build-tools-\d*.\d*.\d*")
    - runas: {{ user }}
    - unless: ls /usr/local/opt/android-sdk/build-tools

Add API 21:
  cmd.run:
    - name: echo y | android update sdk --no-ui --filter 'android-21'
    - runas: {{ user }}
    - unless: ls /usr/local/opt/android-sdk/platforms/android-21

Add API 25:
  cmd.run:
    - name: echo y | android update sdk --no-ui --filter 'android-25'
    - runas: {{ user }}
    - unless: ls /usr/local/opt/android-sdk/platforms/android-25

Add android support repository:
  cmd.run:
    - name: echo y | android update sdk --no-ui --filter 'extra-android-m2repository'
    - runas: {{ user }}
    - unless: ls /usr/local/opt/android-sdk/extras/google/m2repository
