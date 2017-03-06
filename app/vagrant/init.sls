{% set user = salt['pillar.get']('users:primary-user') %}

Make sure the user can sudo with nopasswd:
  file.append:
    - name: /etc/sudoers
    - text: |

        # Added by salt to facilitate cask install.  Remains commented unless in use.
        # {{ user}} ALL = NOPASSWD: (ALL) ALL # CASK_INSTALLER

Uncomment the sudo stuff:
  file.uncomment:
    - name: /etc/sudoers
    - regex: CASK_INSTALLER

Caskroom/cask/vagrant:
  pkg.installed

# We use the hostmanager plugin
vagrant-hostmanager:
  cmd.run:
    - name: vagrant plugin install vagrant-hostmanager
    - unless: vagrant plugin list | grep vagrant-hostmanager

Caskroom/cask/virtualbox:
  pkg.installed

Comment out the nopasswd sudo:
  file.comment:
    - name: /etc/sudoers
    - regex: CASK_INSTALLER
    - backup: False
