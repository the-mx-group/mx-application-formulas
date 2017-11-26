{% set user = salt['pillar.get']('users:primary-user') %}

include:
  - app/magic-sudo
  - app/magic-unsudo
  - app/virtualbox

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


#Only do the mac-specific stuff if it's a mac
{% if grains.os in ('MacOS',) %}
Ensure the user owns his vagrant home:
  file.directory:
    - name: /Users/{{ user}}/.vagrant.d
    - user: {{ user }}
    - recurse:
      - user
{% endif %}

