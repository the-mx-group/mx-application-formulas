{% from "app/zsh/antibody-map.jinja" import antibody with context %}

{{ antibody.package }}:
  {{ antibody.installer }}
