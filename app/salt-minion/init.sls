{% from "app/salt-minion/map.jinja" import salt with context %}

{{ salt.package }}:
  {{ salt.installer }}

#Only do the mac-specific stuff if it's a mac
{% if grains.os in ('MacOS',) %}

Disable salt verification which causes pinwheel at bootup if joined to AD:
  file.managed:
    - name: /etc/salt/minion.d/noverify.conf
    - contents: "verify_env: False"

  {% if not salt['pillar.get']('salt:useformula', False) %}
Deploy salt minion service file:
  file.managed:
    - name: /Library/LaunchDaemons/com.saltstack.salt.minion.plist
    - source: {{ salt.plist_source }}
    - source_hash: {{ salt.plist_hash }}

Register the salt minion service:
  cmd.run:
    - name: "/bin/launchctl load /Library/LaunchDaemons/com.saltstack.salt.minion.plist"
    - unless: "/bin/launchctl list | grep salt-minion"
  {% endif %}

#done with mac-specific stuff
{% endif %}

Enable the salt service:
  service.enabled:
    - name: {{salt.service}}

Start the salt service:
  service.running:
    - name: {{salt.service}}
