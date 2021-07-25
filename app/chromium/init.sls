{% from tpldir ~ "/map.jinja" import config with context %}

{{ config.installer | yaml(False) }}
