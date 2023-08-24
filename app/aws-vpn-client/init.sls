{% from "app/aws-vpn-client/map.jinja" import awsvpnclient with context %}

include:
  repo/aws-vpn-client

{{ awsvpnclient.package }}:
  {{ awsvpnclient.installer }}
