{% set user = salt['pillar.get']('users:primary-user') %}

include:
  - app/java
  - .install.base

