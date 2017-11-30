{% set user = salt['pillar.get']('users:primary-user') %}

include:
  - app/java
  - .install.base
  - .install.build-tools
  - .install.platforms
  - .install.emulator
  - .install.system-images

