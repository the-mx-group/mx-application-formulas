{% from "app/dotnet/map.jinja" import dotnet with context %}
{% set user = salt['pillar.get']('users:primary-user') %}
{% set userInfo = salt['user.info'](user) %}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ dotnet.package }}:
  {{ dotnet.installer }}

#Only do the mac-specific stuff if it's a mac
{% if grains.os in ('MacOS',) %}

Ensure primary user mx_profile exists before adding dotnet:
  file.managed:
    - name: {{ userInfo.home }}/.mx_profile
    - user: root
    - replace: false

Add dotnet to primary user bash profile:
  file.append:
    - text: |

        #dotnet path
        DOTNET_PATH=`cat /etc/paths.d/dotnet`
        export PATH="$PATH:$DOTNET_PATH"
    - name: {{ userInfo.home }}/.mx_profile

#done with mac-specific stuff
{% endif %}

#Only do the linux-specific stuff if it's a linux
{% if grains.os in ('Arch','Linux') %}

Ensure primary user mx_profile exists before adding dotnet:
  file.managed:
    - name: {{ userInfo.home }}/.mx_profile
    - user: root
    - replace: false

Add dotnet to primary user bash profile:
  file.append:
    - text: |

        #dotnet sdk path
        export MSBuildSDKsPath=/usr/share/dotnet/sdk/$(dotnet --version)/Sdks
    - name: {{ userInfo.home }}/.mx_profile

#done with linux-specific stuff
{% endif %}
