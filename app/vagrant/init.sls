{% set user = salt['pillar.get']('users:primary-user') %}

include:
  - app/magic-sudo
  - app/magic-unsudo

Caskroom/cask/vagrant:
  pkg.installed:
    - require:
      - sls: app/magic-sudo

# We use the hostmanager plugin
vagrant-hostmanager:
  cmd.run:
    - name: vagrant plugin install vagrant-hostmanager
    - runas: {{ user }}
    - unless: vagrant plugin list | grep vagrant-hostmanager

Ensure the user owns his vagrant home:
  file.directory:
    - name: /Users/{{ user}}/.vagrant.d
    - user: {{ user }}
    - recurse:
      - user

Install vbox:
  pkg.installed:
    - pkgs:
      - Caskroom/cask/virtualbox
    - require:
      - sls: app/magic-sudo
