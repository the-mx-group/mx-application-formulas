{% from "app/libreoffice/map.jinja" import libreoffice with context %}

{{ libreoffice.package }}:
  {{ libreoffice.installer }}
