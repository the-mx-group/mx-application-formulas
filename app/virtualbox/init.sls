{% from "app/virtualbox/map.jinja" import virtualbox with context %}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ virtualbox.package }}:
  {{ virtualbox.installer }}
