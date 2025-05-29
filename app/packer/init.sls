{% from "app/packer/map.jinja" import packer with context %}

include:
  - repo/hashicorp

{{ packer.package }}:
  {{ packer.installer }}
