{% from "app/firefox/map.jinja" import firefox with context %}

{{ firefox.package }}:
  {{ firefox.installer }}
