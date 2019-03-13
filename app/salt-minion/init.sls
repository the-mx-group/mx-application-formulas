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
    - source: https://raw.githubusercontent.com/saltstack/salt/develop/pkg/darwin/com.saltstack.salt.minion.plist
    - source_hash: sha256=6383d2d336b06802bfdf25a4c21ee25c85ee9fa57d3ef5776321d9c8cd096395

Register the salt minion service:
  cmd.run:
    - name: "/bin/launchctl load /Library/LaunchDaemons/com.saltstack.salt.minion.plist"
    - unless: "/bin/launchctl list | grep salt-minion"

#done with mac-specific stuff
{% endif %}

Enable the salt service:
  service.enabled:
    - name: {{salt.service}}

Start the salt service:
  service.running:
    - name: {{salt.service}}
