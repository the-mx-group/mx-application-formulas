{% set user = salt['pillar.get']('users:primary-user') %}

#Java 8 by default
Caskroom/cask/java:
  pkg.installed

jenv:
  pkg.installed

Add jenv to primary user bash profile:
  file.append:
    - text: |
        export PATH="$HOME/.jenv/bin:$PATH"
        eval "$(jenv init -)"
    - name: /Users/{{ user }}/.bash_profile
