{% from "app/azure-data-studio/map.jinja" import azuredatastudio with context %}

{{ azuredatastudio.package }}:
  {{ azuredatastudio.installer }}

