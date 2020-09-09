{% from "app/7zip/map.jinja" import sevenzip with context %}

{{ sevenzip.package }}:
  {{ sevenzip.installer }}
