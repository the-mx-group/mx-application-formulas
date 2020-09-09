{% if grains.os in ('Windows','MacOS') %}
{% from "app/ms-office/map.jinja" import microsoft-office with context %}

{{ microsoft-office.package }}:
  {{ microsoft-office.installer }}

{% endif %}
