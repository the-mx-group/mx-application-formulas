{% from "app/mysql/map.jinja" import mysql with context %}

{{ mysql.package }}:
  {{ mysql.installer }}
