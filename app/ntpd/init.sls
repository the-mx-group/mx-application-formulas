{% from "app/ntp/map.jinja" import ntp with context %}

{{ ntp.package }}:
  {{ ntp.installer }}

{% if ntp.installer != 'test.nop' %}

Ensure ntp is running:
  service.running:
    - name: ntpd
    - enable: True

{% endif %}
