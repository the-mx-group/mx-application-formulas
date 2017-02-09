Install salt using brew:
  pkg.installed:
    - name: saltstack

Deploy salt minion service file:
  file.managed:
    - name: /Library/LaunchDaemons/com.saltstack.salt.minion.plist
    - source: https://raw.githubusercontent.com/saltstack/salt/develop/pkg/darwin/com.saltstack.salt.minion.plist
    - source_hash: sha256=9a5a0ee8357ee63b38c198dd03e7d101b71ecd9cefb6c2e74803781c4c9290b0

Register the salt minion service:
  cmd.run:
    - name: "/bin/launchctl load /Library/LaunchDaemons/com.saltstack.salt.minion.plist"
    - unless: "/bin/launchctl list | grep salt-minion"

Enable the salt service:
  service.enabled:
    - name: salt-minion

Start the salt service:
  service.running:
    - name: salt-minion
