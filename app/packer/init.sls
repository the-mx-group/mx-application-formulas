{% from "app/packer/map.jinja" import packer with context %}

{{ packer.package }}:
  {{ packer.installer }}
