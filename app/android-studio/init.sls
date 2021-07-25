{% from tpldir ~ "/map.jinja" import config with context %}

{{ config.package }}:
  {{ config.installer | yaml(False) }}
