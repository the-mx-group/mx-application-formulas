{% set user = salt['pillar.get']('users:primary-user') %}

docker:
  pkg.installed

docker-machine:
  pkg.installed

docker-compose:
  pkg.installed

boot2docker:
  pkg.installed

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

