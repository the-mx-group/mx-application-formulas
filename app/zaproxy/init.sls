{% from "app/zaproxy/map.jinja" import zaproxy with context %}

{{ zaproxy.package }}:
  {{ zaproxy.installer }}
