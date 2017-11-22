{% from "app/gitkraken/map.jinja" import kraken with context %}

{{ kraken.package }}:
  {{ kraken.installer }}
