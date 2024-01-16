{% from "app/aws-vpn-client/map.jinja" import awsvpnclient with context %}

include:
  - repo/aws-vpn-client

{{ awsvpnclient.package }}:
  {{ awsvpnclient.installer }}

{%- if grains['os_family'] in ('Debian',) %}

Install old SSL version as well:
  pkg.installed:
    - sources:
      - libssl1.1: http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.20_amd64.deb

{%- endif %}
