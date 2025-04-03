{%- if grains['os_family'] in ('Debian',) %}

Add AWS VPN Client repo:
  pkgrepo.managed:
    - name: 'deb [arch=amd64 signed-by=/etc/apt/keyrings/awsvpnclient_public_key.gpg] https://d20adtppz83p9s.cloudfront.net/GTK/latest/debian-repo ubuntu main'
    - file: '/etc/apt/sources.list.d/aws-vpn-client.list'
    - key_url: 'https://d20adtppz83p9s.cloudfront.net/GTK/latest/debian-repo/awsvpnclient_public_key.asc'
    - aptkey: False

{%- endif %}
