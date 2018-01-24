{% from "app/ntpd/map.jinja" import ntp with context %}

{{ ntp.package }}:
  {{ ntp.installer }}

{% if ntp.installer != 'test.nop' %}

Ensure ntp is running:
  service.running:
    - name: {{ ntp.daemon }}
    - enable: True

{% endif %}
