{% from "app/salt-minion/map.jinja" import saltminion with context %}
{% if salt['pillar.get']('salt', None) != None %}
{%  set useformula = salt['pillar.get']('salt:useformula', False) %}
{% else %}
{%  set useformula = False %}
{% endif %}

{{ saltminion.package }}:
  {{ saltminion.installer }}

#Only do the mac-specific stuff if it's a mac
{% if grains.os in ('MacOS',) %}

Disable salt verification which causes pinwheel at bootup if joined to AD:
  file.managed:
    - name: /etc/salt/minion.d/noverify.conf
    - contents: "verify_env: False"

  {% if not useformula %}
Deploy salt minion service file:
  file.managed:
    - name: /Library/LaunchDaemons/com.saltstack.salt.minion.plist
    - source: {{ saltminion.plist_source }}
    - source_hash: {{ saltminion.plist_hash }}

Register the salt minion service:
  cmd.run:
    - name: "/bin/launchctl load /Library/LaunchDaemons/com.saltstack.salt.minion.plist"
    - unless: "/bin/launchctl list | grep salt-minion"
  {% endif %}

#done with mac-specific stuff
{% endif %}

Enable the salt service:
  service.enabled:
    - name: {{saltminion.service}}

Start the salt service:
  service.running:
    - name: {{saltminion.service}}

