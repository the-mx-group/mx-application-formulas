Install salt using brew:
  pkg.installed:
    - name: saltstack

Deploy salt minion as a service:
  file.managed:
    - name: /Library/LaunchDaemons/com.saltstack.salt.minion.plist
    - source: https://raw.githubusercontent.com/saltstack/salt/develop/pkg/darwin/com.saltstack.salt.minion.plist
    - source_hash: sha256=9a5a0ee8357ee63b38c198dd03e7d101b71ecd9cefb6c2e74803781c4c9290b0

Enable the salt service:
  service.enabled:
    - name: salt-minion

Start the salt service:
  service.started:
    - name: salt-minion
