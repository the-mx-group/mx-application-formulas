{% from "app/dotnet/map.jinja" import dotnet with context %}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ dotnet.package }}:
  {{ dotnet.installer }}

#Only do the mac-specific stuff if it's a mac
{% if grains.os in ('MacOS',) %}
{% set user = salt['pillar.get']('users:primary-user') %}

Ensure primary user mx_profile exists before adding dotnet:
  file.managed:
    - name: /Users/{{ user }}/.mx_profile
    - user: {{ user }}
    - replace: false

Add dotnet to primary user bash profile:
  file.append:
    - text: |

        #dotnet path
        DOTNET_PATH=`cat /etc/paths.d/dotnet`
        export PATH="$PATH:$DOTNET_PATH"
    - name: /Users/{{ user }}/.mx_profile

#done with mac-specific stuff
{% endif %}
