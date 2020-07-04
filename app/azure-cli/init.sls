{% from "app/azure-cli/map.jinja" import azurecli with context %}

{{ azurecli.package }}:
  {{ azurecli.installer }}
