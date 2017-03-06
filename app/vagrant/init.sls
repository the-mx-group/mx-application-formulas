{% set user = salt['pillar.get']('users:primary-user') %}

Make sure the user can sudo with nopasswd:
  file.append:
    - name: /etc/sudoers
    - text: |

        # Added by salt to facilitate cask install.  Remains commented unless in use.
        #{{ user}} ALL = (ALL) NOPASSWD:ALL # CASK_INSTALLER

Uncomment the sudo stuff:
  file.uncomment:
    - name: /etc/sudoers
    - regex: {{ user }}.* # CASK_INSTALLER

Caskroom/cask/vagrant:
  pkg.installed

# We use the hostmanager plugin
vagrant-hostmanager:
  cmd.run:
    - name: vagrant plugin install vagrant-hostmanager
    - unless: vagrant plugin list | grep vagrant-hostmanager

Ensure the user owns his vagrant home:
  file.directory:
    - name: /Users/{{ user}}/.vagrant.d
    - user: {{ user }}
    - recurse:
      - user

Install vbox and extensions:
  pkg.installed:
    - pkgs:
      - Caskroom/cask/virtualbox
      - Caskroom/cask/virtualbox-extension-pack

Comment out the nopasswd sudo:
  file.comment:
    - name: /etc/sudoers
    - regex: {{ user }}.* # CASK_INSTALLER
    - backup: False
