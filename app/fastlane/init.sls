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

{% if grains.os in ('Arch',) %}
#Not MacOS, so let's add the user's local gempath to PATH
{% set userinfo = salt['user.info'](user) %}

Append gemfile to bash profile PATH:
  file.append:
    - name: {{ userinfo.home }}/.mx_profile
    - text: export PATH=$PATH:{{ userinfo.home }}/.gem/ruby/$(ruby -e 'print "#{RUBY_VERSION}"')/bin

{% endif %}
