{% from "app/filezilla/map.jinja" import filezilla with context %}

{{ filezilla.package }}:
  {{ filezilla.installer }}
