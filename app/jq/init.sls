{% from "app/jq/map.jinja" import jq with context %}

{{ jq.package }}:
  {{ jq.installer }}
