{% from "app/ntp/map.jinja" import ntp with context %}

{{ ntp.package }}:
  {{ ntp.installer }}
