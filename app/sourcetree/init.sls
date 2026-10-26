{% from "app/sourcetree/map.jinja" import sourcetree with context %}

{{ sourcetree.package }}:
  {{ sourcetree.installer }}
