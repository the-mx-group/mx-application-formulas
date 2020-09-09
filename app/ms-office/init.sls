{% if grains.os in ('Windows','MacOS') %}
{% from "app/ms-office/map.jinja" import msoffice with context %}

{{ msoffice.package }}:
  {{ msoffice.installer }}

{% endif %}
