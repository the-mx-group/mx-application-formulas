{% set user = salt['pillar.get']('users:primary-user') %}

Caskroom/cask/fastlane:
  pkg.installed

Ensure local fastlane is owned by the right user:
  file.directory:
    - name: /Users/{{ user }}/.fastlane
    - user: {{ user }}
    - dir_mode: 0755
    - recurse:
      - user

Ensure fastlane is installed and PATHed:
  cmd.run:
    - runas: {{ user }}
    - name: echo y | /usr/local/Caskroom/fastlane/1.7/install -u -b
    - unless: echo $PATH | grep fastlane
