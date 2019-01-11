{% from "app/salt-minion/map.jinja" import salt with context %}

{{ salt.package }}:
  {{ salt.installer }}

#Only do the mac-specific stuff if it's a mac
{% if grains.os in ('MacOS',) %}

Disable salt verification which causes pinwheel at bootup if joined to AD:
  file.managed:
    - name: /etc/salt/minion.d/noverify.conf
    - contents: "verify_env: False"

Deploy salt minion service file:
  file.managed:
    - name: /Library/LaunchDaemons/com.saltstack.salt.minion.plist
    - source: https://raw.githubusercontent.com/saltstack/salt/develop/pkg/osx/scripts/com.saltstack.salt.minion.plist
    - source_hash: sha256=26b33da12e0d8960ee96b488c8352002c22a377c19bf3df3f986a1e49eca8b20

Register the salt minion service:
  cmd.run:
    - name: "/bin/launchctl load /Library/LaunchDaemons/com.saltstack.salt.minion.plist"
    - unless: "/bin/launchctl list | grep salt-minion"

#done with mac-specific stuff
{% endif %}

Enable the salt service:
  service.enabled:
    - name: salt-minion

Start the salt service:
  service.running:
    - name: salt-minion
