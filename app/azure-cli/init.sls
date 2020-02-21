{% from "app/azurecli/map.jinja" import azurecli with context %}

{{ azurecli.package }}:
  {{ azurecli.installer }}
