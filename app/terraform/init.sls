{% from "app/terraform/map.jinja" import terraform with context %}

include:
  - repo/microsoft-prod

{{ terraform.package }}:
  {{ terraform.installer }}
