{% set user = salt['pillar.get']('users:primary-user') %}

openssl:
  pkg.installed

Caskroom/cask/dotnet:
  pkg.installed

Add dotnet to primary user bash profile:
  file.append:
    - text: |

        #dotnet path
        DOTNET_PATH=`cat /etc/paths.d/dotnet`
        export PATH="$PATH:$DOTNET_PATH"
    - name: /Users/{{ user }}/.bash_profile
