{% set user = salt['pillar.get']('users:primary-user') %}

include:
  - app/magic-sudo
  - app/magic-unsudo

Install packages:
  pkg.installed:
    - pkgs:
      - openssl
      - Caskroom/cask/dotnet
      - Caskroom/cask/dotnet-sdk
    - require:
      - sls: app/magic-sudo

Ensure primary user bash_profile exists before adding dotnet:
  file.managed:
    - name: /Users/{{ user }}/.bash_profile
    - user: {{ user }}
    - replace: false

Add dotnet to primary user bash profile:
  file.append:
    - text: |

        #dotnet path
        DOTNET_PATH=`cat /etc/paths.d/dotnet`
        export PATH="$PATH:$DOTNET_PATH"
    - name: /Users/{{ user }}/.bash_profile
