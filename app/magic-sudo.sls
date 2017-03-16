
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
