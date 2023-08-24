{%- if grains['os_family'] in ('Debian',) %}

# unfortunately AWS VPN Client is not available for 22.04; hardcode to 20.04
Add AWS VPN Client repo:
  pkgrepo.managed:
    - name: 'deb [arch=amd64 signed-by=/etc/apt/keyrings/awsclientvpn-archive-keyring.gpg] https://d20adtppz83p9s.cloudfront.net/GTK/latest/debian-repo ubuntu-20.04 main'
    - file: '/etc/apt/sources.list.d/aws-vpn-client.list'
    - key_url: 'https://d20adtppz83p9s.cloudfront.net/GTK/latest/debian-repo/awsvpnclient_public_key.asc'
    - aptkey: False

{%- endif %}
