{% from "app/zsh/map.jinja" import zsh with context %}

{{ zsh.package }}:
  {{ zsh.installer }}
