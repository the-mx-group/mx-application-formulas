{% from "app/postman/map.jinja" import postman with context %}

{{ postman.package }}:
  {{ postman.installer }}

