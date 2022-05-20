{% from "app/pre-commit/map.jinja" import pre-commit with context %}

{{ pre-commit.package }}:
  {{ pre-commit.installer }}

