{% if grains.os in ('Windows',) %}
{% from tpldir ~ "/map.jinja" import config with context %}

{{ config.package }}:
  {{ config.installer }}

{% endif %}
