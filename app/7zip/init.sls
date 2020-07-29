{% from "app/7zip/map.jinja" import 7zip with context %}

{{ 7zip.package }}:
  {{ 7zip.installer }}
