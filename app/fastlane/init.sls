{% set user = salt['pillar.get']('users:primary-user') %}
{% from "app/fastlane/map.jinja" import fastlane with context %}

{{ fastlane.package }}:
  {{ fastlane.installer }}

Ensure local fastlane is owned by the right user:
  file.directory:
    - name: {{ fastlane.home }}
    - user: {{ user }}
    - dir_mode: 0755
    - recurse:
      - user

{% if grains.os in ('MacOS',) %}
Ensure fastlane is installed and PATHed:
  cmd.run:
    - runas: {{ user }}
    - name: echo y | /usr/local/Caskroom/fastlane/1.7/install -u -b
    - unless: echo $PATH | grep fastlane
{% else %}

#Not MacOS, so let's add the user's local gempath to PATH
{% set userinfo = salt['user.info'](user) %}

Append gemfile to bash profile PATH:
  file.line:
    - name: {{ userinfo.home }}/.bash_profile
    - text: export PATH=$PATH:{{ userinfo.home }}/.gem/ruby/2.4.0/bin
    - mode: ensure
    - user: {{ user }}

{% endif %}
