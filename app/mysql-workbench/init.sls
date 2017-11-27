{% from "app/mysql-workbench/map.jinja" import mysqlworkbench with context %}

{{ mysqlworkbench.package }}:
  {{ mysqlworkbench.installer }}
