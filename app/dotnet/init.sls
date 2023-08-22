{% from "app/dotnet/map.jinja" import dotnet with context %}
{% set user = salt['pillar.get']('users:primary-user') %}
{% set userInfo = salt['user.info'](user) %}

include:
  - app/magic-sudo
  - app/magic-unsudo
  - repo/microsoft-prod

{% if grains.os in ('Ubuntu') %}
Deprioritize builtin Ubuntu dotnet packages:
  file.managed:
    - name: /etc/apt/preferences.d/dotnet
    - user: root
    - contents: |
        Package: dotnet* aspnet* netstandard*
        Pin: origin packages.microsoft.com
        Pin-Priority: 1001
{% endif %}

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
        # add dotnet tools to path as well
        export PATH=$PATH:~/.dotnet/tools
    - name: {{ userInfo.home }}/.mx_profile

#done with linux-specific stuff
{% endif %}
