{% from "app/vagrant/map.jinja" import vagrant with context %}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ vagrant.package }}:
  {{ vagrant.installer }}

{% set user = salt['pillar.get']('users:primary-user') %}
# We use the hostmanager plugin
vagrant-hostmanager:
  cmd.run:
    - name: vagrant plugin install vagrant-hostmanager
    - runas: {{ user }}
    - unless: vagrant plugin list | grep vagrant-hostmanager

# and the vbguest plugin
vagrant-vbguest:
  cmd.run:
    - name: vagrant plugin install vagrant-vbguest
    - runas: {{ user }}
    - unless: vagrant plugin list | grep vagrant-vbguest

#Only do the mac-specific stuff if it's a mac
{% if grains.os in ('MacOS',) %}
Ensure the user owns his vagrant home:
  file.directory:
    - name: /Users/{{ user}}/.vagrant.d
    - user: {{ user }}
    - recurse:
      - user
{% endif %}

