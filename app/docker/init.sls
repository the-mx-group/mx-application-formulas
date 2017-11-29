{% set user = salt['pillar.get']('users:primary-user') %}

docker:
  pkg.installed

#Don't need docker-machine etc on linux
{% if grains.os not in ('Linux','Arch') %}

docker-machine:
  pkg.installed

docker-compose:
  pkg.installed

boot2docker:
  pkg.installed


  {% if grains.os in ('MacOS',) %}

Append docker-machine to users profile:
  file.append:
    - text: |
        #Docker Machine
        docker-machine status | grep "Running" > /dev/null
        if [ $? -eq 0 ]
        then
          eval $(docker-machine env)
        fi
    - name: /Users/{{ user }}/.bash_profile


  {% endif %}

{% else %}

# This is configuration for Linux docker-native platforms

Ensure primary user is in docker group:
  group.present:
    - name: docker
    - addusers:
      - {{ user }}

{% endif %}
