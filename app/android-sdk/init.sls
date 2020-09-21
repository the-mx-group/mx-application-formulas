{% set user = salt['pillar.get']('users:primary-user') %}

include:
  - app/java11
  - app/gradle
  - .install.base
  - .install.build-tools
  - .install.platforms
  - .install.emulator
  - .install.system-images

