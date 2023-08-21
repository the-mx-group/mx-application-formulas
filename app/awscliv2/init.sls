{% from "app/awscliv2/map.jinja" import awscli with context %}

{{ awscli.package }}:
  {{ awscli.installer }}

#Only do the mac-specific stuff if it's a mac
{% if grains.os in ('MacOS',) %}

aws-keychain:
  pkg.installed

#done with mac-specific stuff
{% endif %}
