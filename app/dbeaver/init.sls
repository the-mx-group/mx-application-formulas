{% from "app/dbeaver/map.jinja" import dbeaver with context %}

{{ dbeaver.package }}:
  {{ dbeaver.installer }}

