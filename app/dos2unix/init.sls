{% from "app/dos2unix/map.jinja" import dos2unix with context %}

{{ dos2unix.package }}:
  {{ dos2unix.installer }}

