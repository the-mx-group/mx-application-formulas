{% from "app/mongodb/map.jinja" import mongodb with context %}

{{ mongodb.package }}:
  {{ mongodb.installer }}
