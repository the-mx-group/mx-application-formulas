{% from "app/terraform/map.jinja" import terraform with context %}

include:
  - repo/hashicorp

{{ terraform.package }}:
  {{ terraform.installer }}
