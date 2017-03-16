{% set user = salt['pillar.get']('users:primary-user') %}

include:
  - ..magic-sudo
  - ..magic-unsudo

#Java 8 by default
Caskroom/cask/java:
  pkg.installed:
    - require:
      - sls: ..magic-sudo

jenv:
  pkg.installed

Add jenv to primary user bash profile:
  file.append:
    - text: |
        export PATH="$HOME/.jenv/bin:$PATH"
        eval "$(jenv init -)"
    - name: /Users/{{ user }}/.bash_profile
