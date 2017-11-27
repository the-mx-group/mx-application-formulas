{% from "app/java/map.jinja" import java with context %}

include:
  - app/magic-sudo
  - app/magic-unsudo

{{ java.package }}:
  {{ java.installer }}
